import 'package:flutter/material.dart';

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({
    required WidgetBuilder builder,
  }) : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return new FadeTransition(opacity: animation, child: child);
  }
}
