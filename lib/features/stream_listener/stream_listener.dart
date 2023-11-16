import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'stream_base/stream_base.dart';

typedef StreamWidgetListener<State> = void Function(
  BuildContext context,
  State state,
);

typedef StreamListenerCondition<State> = bool Function(
  State previous,
  State current,
);

class StreamListener<S> extends StreamListenerBase<S> {
  const StreamListener({
    required StreamWidgetListener<S> listener,
    StreamListenerCondition<S>? listenWhen,
    Widget? child,
    Stream<S>? stream,
    S? initialState,
    Key? key,
  }) : super(
          key: key,
          child: child,
          listener: listener,
          stream: stream,
          listenWhen: listenWhen,
        );
}

abstract class StreamListenerBase<S> extends SingleChildStatefulWidget {
  final Stream<S>? stream;
  final StreamListenerCondition<S>? listenWhen;
  final StreamWidgetListener<S> listener;
  final S? initialState;
  final Widget? child;

  const StreamListenerBase({
    required this.listener,
    this.stream,
    this.child,
    this.listenWhen,
    this.initialState,
    Key? key,
  }) : super(
          child: child,
          key: key,
        );

  @override
  SingleChildState<StreamListenerBase<S>> createState() =>
      _BlocListenerBaseState<S>();
}

class _BlocListenerBaseState<S>
    extends SingleChildState<StreamListenerBase<S>> {
  late StreamSubscription<S> _subscription;
  late Observable<S> _observable;

  S? _state;

  @override
  void initState() {
    super.initState();
    setInitialState();
    _observable = Observable.fromStream(
      stream: widget.stream ?? context.read<Stream<S>>(),
      initial: widget.initialState,
    );
    _subscribe();
  }

  void setInitialState() => _state = widget.initialState;

  @override
  void didUpdateWidget(StreamListenerBase<S> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldObservable = Observable.fromStream(
        stream: oldWidget.stream ?? context.read<Stream<S>>());

    late final Observable<S> currentObservable;

    if (widget.stream != null) {
      currentObservable = Observable.fromStream(
        stream: widget.stream!,
      );
    } else {
      currentObservable = oldObservable;
    }

    if (oldObservable != currentObservable) {
      _observable = currentObservable;
      _state = _observable.state ?? oldObservable.state ?? widget.initialState!;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final observable = Observable.fromStream(
      stream: widget.stream ?? context.read<Stream<S>>(),
    );

    if (_observable != observable) {
      _observable = observable;
      _state = _observable.state ?? widget.initialState;
    }
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(
      child != null,
      '''${widget.runtimeType} used outside of 
      Provider.value(<Stream<State> value) must specify a child''',
    );

    if (widget.stream == null) {
      context.select<Stream<S>, bool>((stream) {
        return identical(_observable, stream);
      });
    }

    return child!;
  }

  @override
  void dispose() {
    _unsubscribe();
    super.dispose();
  }

  void _subscribe() {
    _subscription = _observable.stream.listen((state) {
      if (widget.listenWhen?.call(_state ?? state, state) ?? true) {
        widget.listener(context, state);
      }

      _state = state;
    });
  }

  void _unsubscribe() {
    _subscription.cancel();
    _observable.close();
  }
}
