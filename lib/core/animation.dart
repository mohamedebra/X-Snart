import 'dart:math';

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/widgets.dart';

final options = LiveOptions(
  
  // Start animation after (default zero)
  // delay: Duration(seconds: 1),

  // Show each item through (default 250)
  // showItemInterval: Duration(milliseconds: 500),
  //
  // // Animation duration (default 250)
  showItemDuration: Duration(milliseconds: 350),

  // Animations starts at 0.05 visible
  // item fraction in sight (default 0.025)
  visibleFraction: 0.05,

  // Repeat the animation of the appearance
  // when scrolling in the opposite direction (default false)
  // To get the effect as in a showcase for ListView, set true
  reAnimateOnVisibility: true,
);

class MdAnimation extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  const MdAnimation({Key? key, required this.child, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            // Paste you Widget
            child: child));
  }
}

class MdSelfAnimation extends StatelessWidget {
  final Widget child;
  final String? tag;

  const MdSelfAnimation({
    Key? key,
    required this.child,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimateIfVisibleWrapper(

        // Show each item through (default 250)
        showItemInterval: Duration(milliseconds: 100),
        child: AnimateIfVisible(
            reAnimateOnVisibility: true,
            key: Key('item.${tag ?? '${RandomInt.generate(max: 100003)}'}'),
            duration: Duration(milliseconds: 500),
            builder: (
              context,
              animation,
            ) =>
                FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    // And slide transition
                    child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0, -0.1),
                          end: Offset.zero,
                        ).animate(animation),
                        // Paste you Widget
                        child: child))));
  }
}

extension RandomInt on int {
  static int generate({int min = 0, required int max}) {
    final _random = Random();
    return min + _random.nextInt(max - min);
  }
}
