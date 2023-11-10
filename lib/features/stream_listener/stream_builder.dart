import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'stream_base.dart';
import 'stream_listener.dart';

typedef BlocWidgetBuilder<State> = Widget Function(
    BuildContext context, State state);

typedef BlocBuilderCondition<State> = bool Function(
    State previous, State current);

class StreamBuilder<S> extends BlocBuilderBase<S> {
  final BlocWidgetBuilder<S> builder;

  const StreamBuilder({
    required this.builder,
    required S initialState,
    Stream<S>? stream,
    BlocBuilderCondition<S>? buildWhen,
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

abstract class BlocBuilderBase<S> extends StatefulWidget {
  final S initialState;
  final Stream<S>? stream;
  final BlocBuilderCondition<S>? buildWhen;

  const BlocBuilderBase({
    required this.initialState,
    this.buildWhen,
    this.stream,
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context, S state);

  @override
  State<BlocBuilderBase<S>> createState() => _BlocBuilderBaseState<S>();
}

class _BlocBuilderBaseState<S> extends State<BlocBuilderBase<S>> {
  late Observable<S> _observable;
  late S _state;

  @override
  void initState() {
    super.initState();
    _observable = Observable.fromStream(
        stream: widget.stream ?? context.read<Stream<S>>());
    _observable.state;
    _state = widget.initialState;
  }

  // @override
  // void didUpdateWidget(BlocBuilderBase<S> oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   final oldObservable = Observable.fromStream(
  //       stream: oldWidget.stream ?? context.read<Stream<S>>());
  //
  //   late final Observable<S> currentObservable;
  //
  //   if (widget.stream != null) {
  //     currentObservable = Observable.fromStream(
  //       stream: widget.stream!,
  //     );
  //   } else {
  //     currentObservable = oldObservable;
  //   }
  //
  //   if (oldObservable != currentObservable) {
  //     _observable = currentObservable;
  //     _state = _observable.state ?? oldObservable.state ?? widget.initialState!;
  //   }
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final bloc = widget.bloc ?? context.read<B>();
  //   if (_bloc != bloc) {
  //     _bloc = bloc;
  //     _state = _bloc.state;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // if (widget.bloc == null) {
    //   context.select<B, bool>((bloc) => identical(_bloc, bloc));
    // }

    return StreamListener<S>(
      stream: _observable.stream,
      listenWhen: widget.buildWhen,
      listener: (context, state) => setState(() => _state = state),
      child: widget.build(context, _state),
    );
  }
}
