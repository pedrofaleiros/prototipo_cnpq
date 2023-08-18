import 'package:flutter/material.dart';

class RemoveOverscrollIndicator extends StatelessWidget {
  const RemoveOverscrollIndicator({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: child,
    );
  }
}
