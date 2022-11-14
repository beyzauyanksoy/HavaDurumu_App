import 'package:flutter/cupertino.dart';
import 'package:weatherapp/models/current_weather_response.dart';
import 'package:weatherapp/services/api_service.dart';

class WeatherProvider with ChangeNotifier{
  CurrentWeatherResponse response=CurrentWeatherResponse();
  bool isLoading =false;

  getWeatherData(context)async{
    isLoading=true;
    response=(await getCurrentData(context))!;
    isLoading=false;
    notifyListeners()
;  }
}