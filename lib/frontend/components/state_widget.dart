import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
    Use this widget to wrap parts of code that need to respond to changes
    of a certain kind.

    * stateModel is the model that will handle the state changes for set of widgets
    * builder is callback used to return widgets that should be rebuilt on changes
    * child is optional and corresponds to items that should not be rebuilt on changes
    * onStart is optional and is callback on model for initial work to be done
 */
class StateWidget<T extends ChangeNotifier> extends StatefulWidget {
  final T stateModel;
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Widget child;
  final Function(T) onStart;

  StateWidget({
    Key key,
    this.builder,
    this.stateModel,
    this.child,
    this.onStart,
  }) : super(key: key);

  _StateWidgetState<T> createState() => _StateWidgetState<T>();
}

class _StateWidgetState<T extends ChangeNotifier>
    extends State<StateWidget<T>> {
  T stateModel;

  @override
  void initState() {
    stateModel = widget.stateModel;

    if (widget.onStart != null) {
      widget.onStart(stateModel);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => stateModel,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
