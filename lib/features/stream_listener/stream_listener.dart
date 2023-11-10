import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'stream_base.dart';

typedef StreamWidgetListener<State> = void Function(
  BuildContext context,
  State state,
);

typedef StreamListenerCondition<State> = bool Function(
  State previous,
  State current,
);

class StreamListener<State> extends StreamListenerBase<State> {
  const StreamListener({
    required StreamWidgetListener<State> listener,
    StreamListenerCondition<State>? listenWhen,
    Widget? child,
    Stream<State>? stream,
    State? initialState,
    Key? key,
  }) : super(
          key: key,
          child: child,
          listener: listener,
          stream: stream,
          listenWhen: listenWhen,
        );
}

abstract class StreamListenerBase<State> extends SingleChildStatefulWidget {
  final Stream<State>? stream;
  final StreamListenerCondition<State>? listenWhen;
  final StreamWidgetListener<State> listener;
  final State? initialState;
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
  SingleChildState<StreamListenerBase<State>> createState() =>
      _BlocListenerBaseState<State>();
}

class _BlocListenerBaseState<State>
    extends SingleChildState<StreamListenerBase<State>> {
  late StreamSubscription<State> _subscription;
  late Observable<State> _observable;

  State? _previousState;

  @override
  void initState() {
    super.initState();
    setInitialState();
    _observable = Observable.fromStream(
      stream: widget.stream ?? context.read<Stream<State>>(),
      initial: widget.initialState,
    );
    _subscribe();
  }

  void setInitialState() => _previousState = widget.initialState;

  // @override
  // void didUpdateWidget(StreamListenerBase<State> oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   final oldBloc = oldWidget.stream ?? context.read<Stream<State>>();
  //   final currentBloc = widget.stream ?? oldBloc;
  //   if (oldBloc != currentBloc) {
  //     if (_subscription != null) {
  //       _unsubscribe();
  //       _observable = currentBloc;
  //       // _previousState = _bloc.state;
  //     }
  //     _subscribe();
  //   }
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final bloc = widget.bloc ?? context.read<B>();
  //   if (_bloc != bloc) {
  //     if (_subscription != null) {
  //       _unsubscribe();
  //       _bloc = bloc;
  //       _previousState = _bloc.data;
  //     }
  //     _subscribe();
  //   }
  // }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(
      child != null,
      '''${widget.runtimeType} used outside of 
      Provider.value(<Stream<State> value) must specify a child''',
    );

    if (widget.stream == null) {
      context.select<Stream<State>, bool>((stream) {
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
      if (widget.listenWhen?.call(_previousState ?? state, state) ?? true) {
        widget.listener(context, state);
      }

      _previousState = state;
    });
  }

  void _unsubscribe() {
    _subscription.cancel();
    _observable.close();
  }
}
