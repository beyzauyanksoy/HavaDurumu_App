import 'package:flutter/cupertino.dart';
import 'package:weatherapp/models/current_weather_response.dart';
import 'package:weatherapp/services/api_service.dart';

import '../models/clock_weather_response.dart';

class WeatherProvider with ChangeNotifier {
  CurrentWeatherResponse? response = CurrentWeatherResponse();
 HourlyWeatherResponse? clockResponse=HourlyWeatherResponse();
  bool isLoading = true;
  String nowClock="09.00";
  String nowDate="2022-11-10";

  Lista? clockItem;
  getWeatherData() async {
    isLoading = true;
    response = await getDioCurrentWeather();
    isLoading = false;
    notifyListeners();
  }

  

  getClockData() async {
    clockResponse = await getDioClockWeather();
    notifyListeners();
  }




}
