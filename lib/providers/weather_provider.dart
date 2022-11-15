import 'package:flutter/cupertino.dart';
import 'package:weatherapp/models/current_weather_response.dart';
import 'package:weatherapp/services/api_service.dart';

import '../models/clock_weather_response.dart';

class WeatherProvider with ChangeNotifier {
  CurrentWeatherResponse? response = CurrentWeatherResponse();
  bool isLoading = true;

  getWeatherData() async {
    isLoading = true;
    response = await getCurrentData();
    isLoading = false;
    notifyListeners();
  }

  HourlyWeatherResponse? clockResponse;

  getClockData() async {
    clockResponse = await getClockWeather();
    notifyListeners();
  }

}
