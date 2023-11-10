import 'dart:async';

abstract class Observable<State> {
  factory Observable.fromStream({
    required Stream<State> stream,
    State? initial,
  }) =>
      _Observable(
        stream,
        initial: initial,
      );

  Stream<State> get stream;

  State? get state;

  bool get hasState;

  FutureOr<void> close();
}

class _Observable<State> implements Observable<State> {
  late final StreamController<State> _streamController;
  late StreamSubscription<State> _subscription;
  State? _state;

  _Observable(
    Stream<State> stream, {
    State? initial,
  }) {
    _streamController = StreamController.broadcast()..addStream(stream);

    if (initial != null) {
      _state = initial;
    }

    _subscribe();
  }

  @override
  Stream<State> get stream => _streamController.stream;

  @override
  State? get state => _state;

  @override
  bool get hasState => _state != null;

  @override
  Future<void> close() => _subscription.cancel();

  void _subscribe() {
    _streamController.stream.listen((event) {
      _state = event;
    });
  }
}
