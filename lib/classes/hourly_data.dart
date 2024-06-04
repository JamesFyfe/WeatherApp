class HourlyData {
  DateTime time;
  double tempK;
  String weatherCode;
  String iconUrl;

  HourlyData({
    required this.time,
    required this.tempK,
    required this.weatherCode,
    required this.iconUrl,
  });

  static HourlyData jsonToHourlyData(Map<String, dynamic> data) {
    DateTime dataTime = DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000);
    double dataTemp = data['main']['temp'].toDouble();
    String dataWeatherCode = data['weather'][0]['id'].toString();
    String dataIconId = data['weather'][0]['icon'];
    String dataIconUrl = 'https://openweathermap.org/img/wn/$dataIconId@2x.png';

    return HourlyData(
      time: dataTime,
      tempK: dataTemp,
      weatherCode: dataWeatherCode,
      iconUrl: dataIconUrl,
    );
  }

  @override
  String toString() {
    return 'HourlyData(time: $time, tempK: $tempK, icon: $iconUrl)';
  }
}
