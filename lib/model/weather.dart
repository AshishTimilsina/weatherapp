// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  num? latitude;
  num? longitude;
  num? temp;
  String? country;
  num? weatherid;
  String? description;
  String? placename;
  num? wind;
  num? humidity;
  Weather({
    this.humidity,
    this.latitude,
    this.longitude,
    this.temp,
    this.country,
    this.weatherid,
    this.description,
    this.placename,
    this.wind,
  });

  factory Weather.fromjson(Map<String, dynamic> json) {
    return Weather(
        latitude: json['coord']['lat'],
        longitude: json['coord']['lon'],
        temp: json['main']['temp'],
        country: json['sys']['country'],
        weatherid: json['weather'][0]['id'],
        description: json['weather'][0]['description'],
        placename: json['name'],
        wind: json['wind']['speed'],
        humidity: json['main']['humidity']);
  }
}
