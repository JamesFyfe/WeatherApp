import 'package:intl/intl.dart';
import 'package:weather_app/classes/hourly_data.dart';
import 'package:collection/collection.dart';
import 'package:weather_app/utils/utils.dart';

class DailyData {
  DateTime midnight;
  String day;
  double tempHighK;
  double tempLowK;
  String iconUrl;

  DailyData(
      {required this.midnight,
      required this.day,
      required this.tempHighK,
      required this.tempLowK,
      required this.iconUrl});

  static List<DailyData> hourlyToDailyData(List<HourlyData> data) {
    Map<DateTime, List<HourlyData>> groupedData =
        groupBy(data, (HourlyData entry) {
      return DateTime(entry.time.year, entry.time.month, entry.time.day);
    });

    List<DailyData> dailyList = groupedData.entries
        .map((entry) {
          double tempHigh = getHighTemp(entry.value);
          double tempLow = getLowTemp(entry.value);

          String dayIconUrl = getDailyIconId(entry.value);

          return DailyData(
              midnight: entry.key,
              day: DateFormat('EE').format(entry.key),
              tempHighK: tempHigh,
              tempLowK: tempLow,
              iconUrl: dayIconUrl);
        })
        .toList()
        .sublist(0, 5); // sublist so we dont get last day with partial data

    return dailyList;
  }

  @override
  String toString() {
    return 'DailyData(day: $day, highK: $tempHighK, lowK: $tempLowK)';
  }
}
