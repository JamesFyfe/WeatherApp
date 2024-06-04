import 'package:intl/intl.dart';
import 'package:weather_app/classes/hourly_data.dart';

int kelvinToFahrenheit(double kelvin) {
  return ((kelvin - 273.15) * 9 / 5 + 32).round();
}

int kelvinToCelsius(double kelvin) {
  return (kelvin - 273.15).round();
}

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input;
  }

  return input[0].toUpperCase() + input.substring(1);
}

String utcToLocal(DateTime? utc, timeOffset) {
  utc ??= DateTime.now().toUtc();
  final localTime = utc.add(Duration(seconds: timeOffset));
  return DateFormat('h:mm a').format(localTime);
}

double getHighTemp(List<HourlyData> data) {
  if (data.isEmpty) {
    return 0.0;
  }
  double high = data[0].tempK;
  for (HourlyData entry in data) {
    if (entry.tempK > high) {
      high = entry.tempK;
    }
  }
  return high;
}

double getLowTemp(List<HourlyData> data) {
  if (data.isEmpty) {
    return 0.0;
  }
  double low = data[0].tempK;
  for (HourlyData entry in data) {
    if (entry.tempK < low) {
      low = entry.tempK;
    }
  }
  return low;
}

String getDailyIconId(List<HourlyData> data) {
  // find most significant or most common weather even then return corresponding url
  List<String> weatherCodes = [];
  for (HourlyData entry in data) {
    weatherCodes.add(entry.weatherCode);
  }

  int clearCount = 0;
  int cloudsCount = 0;
  int rainCount = 0;
  int thunderCount = 0;
  int snowCount = 0;
  int atmosphereCount = 0;

  for (String code in weatherCodes) {
    switch (code[0]) {
      case '8':
        if (code[2] == '0') {
          clearCount++;
        } else {
          cloudsCount++;
        }
        break;
      case '2':
        thunderCount++;
        break;
      case '3':
        rainCount++;
        break;
      case '5':
        rainCount++;
        break;
      case '6':
        snowCount++;
        break;
      case '7':
        atmosphereCount++;
        break;
      default:
    }
  }

  String iconId = '';
  // use most significant weather events first if they happen on a day
  if (thunderCount > 0) {
    iconId = '11d';
  } else if (snowCount > 0) {
    iconId = '13d';
  } else if (rainCount > 0) {
    iconId = '10d';
  } else if (atmosphereCount > 0) {
    iconId = '50d';
  } else if (cloudsCount > clearCount) {
    iconId = '03d';
  } else {
    iconId = '01d';
  }

  return 'https://openweathermap.org/img/wn/$iconId@2x.png';
}
