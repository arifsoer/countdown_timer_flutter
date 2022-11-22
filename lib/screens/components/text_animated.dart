import 'package:flutter/material.dart';

class TextAnimated extends StatelessWidget {
  const TextAnimated({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final digits = text.split("");
    return Row(
      children: [
        DoAnimation(number: int.parse(digits[0])),
        DoAnimation(number: int.parse(digits[1])),
      ],
    );
  }
}

class DoAnimation extends StatefulWidget {
  const DoAnimation({super.key, required this.number});

  final int number;

  @override
  State<DoAnimation> createState() => _DoAnimationState();
}

class _DoAnimationState extends State<DoAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late ValueNotifier<int> textChanged = ValueNotifier<int>(0);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController);
    _animation.addListener(animationListener);
    textChanged.addListener(valueChangedListener);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animation.removeListener(animationListener);
    textChanged.removeListener(valueChangedListener);
    textChanged.dispose();
    super.dispose();
  }

  void animationListener() {
    setState(() {});
  }

  void valueChangedListener() {
    _animationController.reset();
    _animationController.forward();
  }

  int getNumberAfter(int currentNumber) {
    int temp = currentNumber + 1;
    if (temp > 9) temp = 0;
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    textChanged.value = widget.number;
    return ClipRect(
      clipper: RectClipper(),
      child: Stack(
        children: [
          FractionalTranslation(
            translation: Offset(0.0, 0 - _animation.value),
            child: Text(
              widget.number.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          FractionalTranslation(
            translation: Offset(0.0, 1 - _animation.value),
            child: Text(
              getNumberAfter(widget.number).toString(),
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
