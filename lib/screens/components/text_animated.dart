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
        DoAnimation(text: digits[0]),
        DoAnimation(text: digits[1]),
      ],
    );
  }
}

class DoAnimation extends StatefulWidget {
  const DoAnimation({super.key, required this.text});

  final String text;

  @override
  State<DoAnimation> createState() => _DoAnimationState();
}

class _DoAnimationState extends State<DoAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late ValueNotifier<String> textChanged = ValueNotifier<String>('');

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animation.addListener(animationListener);
    textChanged.addListener(valueChangedListener);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animation.removeListener(animationListener);
    textChanged.removeListener(valueChangedListener);
    super.dispose();
  }

  void animationListener() {
    setState(() {});
  }

  void valueChangedListener() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    textChanged.value = widget.text;
    return Opacity(
      opacity: _animation.value,
      child: Text(
        textChanged.value,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
