import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'stream_base/stream_base.dart';
import 'stream_listener.dart';

typedef StreamWidgetBuilder<State> = Widget Function(
  BuildContext context,
  State state,
);

typedef StreamBuilderCondition<State> = bool Function(
  State previous,
  State current,
);

class StreamBuilder<S> extends StreamBuilderBase<S> {
  final StreamWidgetBuilder<S> builder;

  const StreamBuilder({
    required this.builder,
    required S initialState,
    Stream<S>? stream,
    StreamBuilderCondition<S>? buildWhen,
    Key? key,
  }) : super(
          buildWhen: buildWhen,
          initialState: initialState,
          stream: stream,
          key: key,
        );

  @override
  Widget build(BuildContext context, S state) => builder(context, state);
}

abstract class StreamBuilderBase<S> extends StatefulWidget {
  final S initialState;
  final Stream<S>? stream;
  final StreamBuilderCondition<S>? buildWhen;

  const StreamBuilderBase({
    required this.initialState,
    this.buildWhen,
    this.stream,
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context, S state);

  @override
  State<StreamBuilderBase<S>> createState() => _StreamBuilderBaseState<S>();
}

class _StreamBuilderBaseState<S> extends State<StreamBuilderBase<S>> {
  late Observable<S> _observable;
  late S _state;

  @override
  void initState() {
    super.initState();
    _observable = Observable.fromStream(
      stream: widget.stream ?? context.read<Stream<S>>(),
    );
    _state = _observable.state ?? widget.initialState;
  }

  @override
  void didUpdateWidget(StreamBuilderBase<S> oldWidget) {
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
  Widget build(BuildContext context) {
    return StreamListener<S>(
      stream: _observable.stream,
      listenWhen: widget.buildWhen,
      listener: (context, state) => setState(() => _state = state),
      child: widget.build(context, _state),
    );
  }
}
