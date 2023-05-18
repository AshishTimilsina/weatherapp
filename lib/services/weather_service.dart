import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/model/weather.dart';

final weatherserviceprovider =
    FutureProvider((ref) => WeatherService().getdata());

class WeatherService {
  final List<Weather> weatherData = [];
  final dio = Dio();

  final String apikey = '4b1d6b89a9179aea5525c9e021145e5e';
  Future<List<Weather>> getdata() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      final response = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apikey');
      Map<String, dynamic> map = response.data;
      final dataa = Weather.fromjson(map);
      weatherData.add(dataa);
      return weatherData;
    } on DioError catch (err) {
      throw err.toString();
    }
  }
}
