// 1. Create a Weather Service API
// - Create a `services/` directory in the `lib/` directory.
// - Create a `weather_api.dart` file in the `services/` directory, this is where you will write your API functions.
import 'dart:convert';
import 'package:http/http.dart' as http;

// - The following requirements must be met:
  // - The OpenWeather API key must be exported as a constant named `weatherApiKey`
const String weatherApiKey = 'ibe9c3b7e8fb0235f67e628b885cb47e7';

  // - The current weather endpoint must be exported as a constant named `currentWeatherEndpoint` with a value that matches the provided format `https://api.openweathermap.org/data/2.5/weather`.
const String currentWeatherEndpoint = 'https://api.openweathermap.org/data/2.5/weather';

  // - A `getWeatherForCity` function must be exported. The function accepts the `city` as a _named parameter_ and will return the `dynamic` JSON data object received from the OpenWeather API endpoint `https://api.openweathermap.org/data/2.5/weather?units=metric&q={city name}&appid={API key}` (use the `currentWeatherEndpoint` from a previous step above to create the full URL).
Future<dynamic> getWeatherForCity({required String city}) async {
  final url = Uri.parse('$currentWeatherEndpoint?units=metric&q=$city&appid=$weatherApiKey');

  try {
    final response = await http.get(url); 
    
    // - If the response status code is anything other than 200, throw an `Exception` with a message in the following format: `There was a problem with the request: status <status code> received`.
    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Decode the JSON response body into a Dart dynamic object (Map or List).
    } else {
      throw Exception('There was a problem with the request: status ${response.statusCode} received.');
    }

    // - If an exception occurs when accessing the endpoint, throw an `Exception` with a message in the following format: `There was a problem with the request: <original exception message>`.
  } catch (e) {
    throw Exception('There was a problem with the request: $e');
  }
}