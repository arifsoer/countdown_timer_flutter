import 'package:countdown_timer/controllers/counter_controller.dart';
import 'package:countdown_timer/models/computed_duration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_animated.dart';

class CounterItem extends StatelessWidget {
  const CounterItem({
    Key? key,
    required this.valueType,
    required this.itemName,
  }) : super(key: key);

  final ValueType valueType;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.find();
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 3,
          color: Colors.black,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => TextAnimated(
              text: controller.resultDiff.getValuebyParam(valueType),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            itemName,
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
