part of '../stream_base.dart';

class _Observable<State> implements Observable<State> {
  late final StreamController<State> _streamController;
  late StreamSubscription<State> _subscription;
  State? _state;

  _Observable(
    Stream<State> stream, {
    bool sync = false,
    State? initial,
  }) {
    _streamController = StreamController.broadcast(
      sync: sync,
    )..addStream(stream);

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
  void close() {
    _streamController.close();
    _subscription.cancel();
  }

  void _subscribe() {
    _streamController.stream.listen((event) {
      _state = event;
    });
  }
}
