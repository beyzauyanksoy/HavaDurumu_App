import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/clock_weather_response.dart';
import '../models/current_weather_response.dart';
import 'package:http/http.dart' as http;

Future<CurrentWeatherResponse?> getCurrentData() async {
  CurrentWeatherResponse weatherResponse;
  try {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=41.029098&lon=29.017084&appid=1fa3b7baabacefd49574cb80f92eaded&units=metric"));
    print(response.body);
    weatherResponse =
        CurrentWeatherResponse.fromJson(jsonDecode(response.body));

    return weatherResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<HourlyWeatherResponse?> getClockWeather() async {
  HourlyWeatherResponse weatherResponse;
  try {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=1fa3b7baabacefd49574cb80f92eaded&units=metric"));
    print(response.body);
    weatherResponse = HourlyWeatherResponse.fromJson(jsonDecode(response.body));

    return weatherResponse; 
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<HourlyWeatherResponse?> getDioClockWeather() async {

    var dioresponse = await Dio().get('https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=1fa3b7baabacefd49574cb80f92eaded&units=metric');
   if(dioresponse.statusCode==200){
    return HourlyWeatherResponse.fromJson(dioresponse.data);
   }
   else{
    print("veri gelmedi");
   }
  
}
Future<CurrentWeatherResponse?> getDioCurrentWeather() async {

    var dioresponse = await Dio().get('https://api.openweathermap.org/data/2.5/weather?lat=41.029098&lon=29.017084&appid=1fa3b7baabacefd49574cb80f92eaded&units=metric');
   if(dioresponse.statusCode==200){
    return CurrentWeatherResponse.fromJson(dioresponse.data);
   }
   else{
    print("veri gelmedi");
   }
  
}