import 'dart:async';

import 'package:countdown_timer/models/computed_duration.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  final DateTime _destinationTime = DateTime.parse('2022-12-10 18:00:00');
  final _duration = ComputedDuration(const Duration()).obs;
  late Timer _timer;
  final _durationPeriodic = const Duration(seconds: 1);

  @override
  void onInit() {
    _timer = Timer.periodic(_durationPeriodic, (timer) {
      final calculatedDuration = _destinationTime.difference(DateTime.now());
      _duration(ComputedDuration(calculatedDuration));
    });
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  ComputedDuration get resultDiff => _duration.value;
}
