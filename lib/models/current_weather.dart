// 2. Create a CurrentWeather class

// - Create a `models/` directory in the `lib/` directory.
// - Create a `current_weather.dart` file in the `models/` directory, this is where you will write your
//  `CurrentWeather` class.

// - The `CurrentWeather` class requires the following members and methods:
//   - private members for:
class CurrentWeather {
  String _city;           //     - city (string)
  String _description;    //     - description (string)
  double _currentTemp;    //     - currentTemp (double)
  DateTime _currentTime;  //     - currentTime (date time)
  DateTime _sunrise;      //     - sunrise (date time)
  DateTime _sunset;       //     - sunset (date time)

  CurrentWeather({ //  - Must have a generative constructor with required named params for each of the members
    required String city,
    required String description,
    required double currentTemp,
    required DateTime currentTime,
    required DateTime sunrise,
    required DateTime sunset,
  })  : _city = '',
        _description = '',
        _currentTemp = 0.0,
        _currentTime = DateTime.now(),
        _sunrise = DateTime.now(),
        _sunset = DateTime.now() {
    this.city = city;
    this.description = description;
    this.currentTemp = currentTemp;
    this.currentTime = currentTime;
    this.sunrise = sunrise;
    this.sunset = sunset;
  }

  //   - The following getters and setters for the private members
  //     - all private members must have a getter
  String get city => _city;
  String get description => _description;
  double get currentTemp => _currentTemp;
  DateTime get currentTime => _currentTime;
  DateTime get sunrise => _sunrise;
  DateTime get sunset => _sunset;

  //     - setter for city must ensure city is not empty
  //       - throw an `Exception` with message 'City cannot be empty'
  set city(String value) {
    if (value.isEmpty) {
      throw Exception('City cannot be empty');
    }
    _city = value;
  } 

  //     - setter for description must ensure description is not empty
  //       - throw an `Exception` with message 'Description cannot be empty'
  set description(String value) {
    if (value.isEmpty) {
      throw Exception('Description cannot be empty');
    }
    _description = value;
  }

  //     - setter for currentTemp must ensure currentTemp is between -100 and 100
  //       - throw an `Exception` with message 'Temperature must be between -100 and 100'
  set currentTemp(double value) {
    if (value < -100 || value > 100) {
      throw Exception('Temperature must be between -100 and 100');
    }
    _currentTemp = value;
  } 
  
  //     - setter for currentTime must ensure currentTime is not in the future
  //       - throw an `Exception` with message 'Current time cannot be in the future'
  set currentTime(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw Exception('Current time cannot be in the future');
    }
    _currentTime = value;
  }

  //    - setter for sunrise must ensure sunrise is on the same day as currentTemp and not after sunrise
  //      - throw an `Exception` with message 'Sunrise must be on the same day as current time' for the former
  set sunrise(DateTime value) {
    if (value.day != _currentTime.day) {
      throw Exception('Sunrise must be on the same day as the current time');
    }
  //      - throw an `Exception` with message 'Sunrise cannot be after sunset' for the latter
    if (value.isAfter(_sunset)) {
      throw Exception('Sunrise cannot be after sunset');
    }
    _sunrise = value;
  }

  //    - setter for sunset must ensure sunset is on the same day as currentTemp and not before sunrise
  //      - throw an `Exception` with message 'Sunset must be on the same day as current time' for the former
  set sunset(DateTime value) {
    if (value.day != currentTime.day) {
      throw Exception('Sunset must be on the same day as current time');
    }
  //      - throw an `Exception` with message 'Sunset cannot be before sunset' for the latter
    if (value.isBefore(_sunrise)) {
      throw Exception('Sunset cannot be before sunrise');
    } 
    _sunset = value;
  }

//  - Must have a factory constructor that accepts a single `dynamic` data param representing the OpenWeather data object for the current weather
//    - The method must parse out the required fields for the generative constructor and use the generative constructor to produce the object to return
  factory CurrentWeather.fromJson(dynamic date) {
    final city = data['name'];
    final description = data['weather'][0]['description'];
    final currentTemp = data['main']['temp'].toDouble();
    final currentTime = DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000, isUtc: true).toLocal();
    final sunrise = DateTime.fromMillisecondsSinceEpoch(data['sys']['sunrise'] * 1000, isUtc: true).toLocal();
    final sunset = DateTime.fromMillisecondsSinceEpoch(data['sys']['sunset'] * 1000, isUtc: true).toLocal();

    return CurrentWeather(
      city: city,
      description: description,
      currentTemp: currentTemp,
      currentTime: currentTime,
      sunrise: sunrise,
      sunset: sunset,
    );
  }
//  - Must override the `toString()` method to return a string in the following format:
//    - `City: <city>, Description: <description>, Current Temperature: <currentTemp>, Current Time: <currentTime>, Sunrise: <sunrise>, Sunset: <sunset>'` where the angle brackets/values must be replaced with the actual member values.
  @override
  String toString() {
    return 'City: $_city, Description: $_description, Current Temperature: $_currentTemp, Current Time: $_currentTime, Sunrise: $_sunrise, Sunset: $_sunset';
  }
}

//  - **NOTE: you will need to think about validation for the sunrise and sunset members in the constructor and the setters, since one necessisarily relies of the value of the other.**