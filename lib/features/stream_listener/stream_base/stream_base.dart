import 'dart:async';

part 'src/observable_impl.dart';

abstract class Observable<State> {
  Stream<State> get stream;

  State? get state;

  bool get hasState;

  FutureOr<void> close();

  factory Observable.fromStream({
    required Stream<State> stream,
    State? initial,
  }) =>
      _Observable(stream, initial: initial);
}
