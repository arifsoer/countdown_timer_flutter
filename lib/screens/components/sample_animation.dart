import 'package:flutter/material.dart';

class SampleAnimation extends StatefulWidget {
  const SampleAnimation({super.key});

  @override
  State<SampleAnimation> createState() => _SampleAnimationState();
}

class _SampleAnimationState extends State<SampleAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller.addListener(() {
      setState(() {});
    });
    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ),
    );
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: RectClipper(),
      child: Stack(
        children: [
          FractionalTranslation(
            translation: Offset(0.0, 0 - _animation.value),
            child: Text(
              '5',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          FractionalTranslation(
            translation: Offset(0.0, 1 - _animation.value),
            child: Text(
              '5',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }
}

class RectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0.0, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
