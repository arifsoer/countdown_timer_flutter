class ComputedDuration {
  final Duration duration;
  late Duration _date;
  late Duration _hour;
  late Duration _minutes;
  late Duration _seconds;

  ComputedDuration(this.duration) {
    _date = duration;
    _hour = duration - Duration(days: _date.inDays);
    _minutes = _hour - Duration(hours: _hour.inHours);
    _seconds = _minutes - Duration(minutes: _minutes.inMinutes);
  }

  String get theDay => _date.inDays.toString();
  String get theHour => _hour.inHours.toString().padLeft(2, '0');
  String get theMinute => _minutes.inMinutes.toString().padLeft(2, '0');
  String get theSecond => _seconds.inSeconds.toString().padLeft(2, '0');

  String getValuebyParam(ValueType valueType) {
    int result = 0;

    switch (valueType) {
      case ValueType.day:
        result = _date.inDays;
        break;
      case ValueType.hour:
        result = _hour.inHours;
        break;
      case ValueType.minute:
        result = _minutes.inMinutes;
        break;
      case ValueType.second:
        result = _seconds.inSeconds;
        break;
    }

    return result.toString().padLeft(2, '0');
  }
}

enum ValueType { day, hour, minute, second }
