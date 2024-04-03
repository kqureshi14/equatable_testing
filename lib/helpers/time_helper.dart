import 'dart:core';

class TimeHelper {
  static String timeAgo(dynamic input) {
    DateTime? date = input is DateTime ? input : DateTime.parse(input);
    final formatter = RelativeTimeFormat('en');
    final ranges = {
      'year': 3600 * 24 * 365,
      'years': 3600 * 24 * 365,
      'quarter': 3600 * 24 * 30 * 3,
      'quarters': 3600 * 24 * 30 * 3,
      'month': 3600 * 24 * 30,
      'months': 3600 * 24 * 30,
      'week': 3600 * 24 * 7,
      'weeks': 3600 * 24 * 7,
      'day': 3600 * 24,
      'days': 3600 * 24,
      'hour': 3600,
      'hours': 3600,
      'minute': 60,
      'minutes': 60,
      'second': 1,
      'seconds': 1
    };
    final secondsElapsed =
        (DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch) /
            1000;
    for (var key in ranges.keys) {
      if (ranges[key]! < secondsElapsed.abs()) {
        final delta = secondsElapsed / ranges[key]!;
        return formatter.format(delta.round(), key);
      }
    }
    return 'few seconds ago';
  }
}

class RelativeTimeFormat {
  RelativeTimeFormat(this.locale);
  String locale;

  String format(int value, String unit) {
    // You can implement your logic for formatting relative time here
    return '$value $unit ago';
  }
}
