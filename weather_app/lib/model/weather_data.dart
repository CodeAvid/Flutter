import 'dart:convert';

WeatherData weatherDataFromJson(String str) =>
    WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

class WeatherData {
  WeatherData(
    this.weather,
    this.wind,
    this.rain,
    this.main,
    this.clouds,
    this.timezone,
    this.name,
  );

  final List<Weather> weather;
  final Wind wind;
  final Rain rain;
  final Main main;
  final Clouds clouds;
  final int timezone;
  final String name;

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        Wind.fromJson(json["wind"]),
        Rain.fromJson(json["rain"]),
        Main.fromJson(json["main"]),
        Clouds.fromJson(json["clouds"]),
        json["timezone"],
        json["name"],
      );

  Map<String, dynamic> toJson() => {
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "wind": wind.toJson(),
        "rain": rain.toJson(),
        "main": main.toJson(),
        "clouds": clouds.toJson(),
        "timezone": timezone,
        "name": name,
      };
}

class Clouds {
  Clouds(
    this.all,
  );

  final int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Main {
  Main(
    this.temp,
    this.humidity,
  );

  final double temp;

  final int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        json["temp"].toDouble(),
        json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "humidity": humidity,
      };
}

class Rain {
  Rain(
    this.the1H,
  );

  final double the1H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        json["1h"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "1h": the1H,
      };
}

class Weather {
  Weather(
    this.description,
  );

  final String description;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        json["description"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
      };
}

class Wind {
  Wind(
    this.speed,
  );

  final double speed;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        json["speed"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
      };
}
