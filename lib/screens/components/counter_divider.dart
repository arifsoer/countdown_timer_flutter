import 'package:flutter/material.dart';

class CounterDivider extends StatelessWidget {
  const CounterDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        ':',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
