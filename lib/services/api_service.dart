import 'dart:convert';
import 'dart:developer';

import '../models/current_weather_response.dart';
import 'package:http/http.dart' as http;

Future<CurrentWeatherResponse?> getCurrentData(context) async {
CurrentWeatherResponse weatherResponse;
try{
  final  response=  await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=41.029098&lon=29.017084&appid=1fa3b7baabacefd49574cb80f92eaded"));
  print(response.body);
  weatherResponse=CurrentWeatherResponse.fromJson(jsonDecode(response.body));

  return weatherResponse;


}
catch(e){
log(e.toString());
}
return null;

}