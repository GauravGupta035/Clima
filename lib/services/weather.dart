import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/cupertino.dart';

const apiKey = 'cbecd0f52a4327d10c7fd1fc3566ad0f';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  Image getBackground(int condition) {
    if (condition < 300) {
      return Image(
        image: AssetImage('Light Rain.jpg'),
      );
    } else if (condition < 400) {
      return Image(
        image: AssetImage('Light Rain.jpg'),
      );
    } else if (condition < 600) {
      return Image(
        image: AssetImage('Heavy Rain.jpg'),
      );
    } else if (condition < 700) {
      return Image(
        image: AssetImage('Winter.jpg'),
      );
    } else if (condition < 800) {
      return Image(
        image: AssetImage('Sunny Day.jpg'),
      );
    } else if (condition == 800) {
      return Image(
        image: AssetImage('Sunny Day.jpg'),
      );
    } else if (condition <= 804) {
      return Image(
        image: AssetImage('Cloudy Sky.jpg'),
      );
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
