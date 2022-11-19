import 'package:countdown_timer/controllers/counter_controller.dart';
import 'package:countdown_timer/models/computed_duration.dart';
import 'package:countdown_timer/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/counter_divider.dart';
import 'components/counter_item.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CounterController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Responsive(
              desktop: HomeDesktop(),
              tablet: HomeMobile(),
              mobile: HomeMobile(),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'to Go back to Surabaya',
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CounterItem(
              valueType: ValueType.day,
              itemName: "hari",
            ),
            CounterDivider(),
            CounterItem(
              valueType: ValueType.hour,
              itemName: "Jam",
            )
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CounterItem(
              valueType: ValueType.minute,
              itemName: "menit",
            ),
            CounterDivider(),
            CounterItem(
              valueType: ValueType.second,
              itemName: "detik",
            )
          ],
        )
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CounterItem(
          valueType: ValueType.day,
          itemName: "hari",
        ),
        CounterDivider(),
        CounterItem(
          valueType: ValueType.hour,
          itemName: "Jam",
        ),
        CounterDivider(),
        CounterItem(
          valueType: ValueType.minute,
          itemName: "menit",
        ),
        CounterDivider(),
        CounterItem(
          valueType: ValueType.second,
          itemName: "detik",
        ),
      ],
    );
  }
}
