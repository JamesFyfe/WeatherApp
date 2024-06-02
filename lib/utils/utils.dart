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
