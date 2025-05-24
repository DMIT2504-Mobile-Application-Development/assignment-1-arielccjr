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
}


//   - The following getters and setters for the private members
//     - all private members must have a getter
//     - setter for city must ensure city is not empty
//       - throw an `Exception` with message 'City cannot be empty'
//     - setter for description must ensure description is not empty
//       - throw an `Exception` with message 'Description cannot be empty'
//     - setter for currentTemp must ensure currentTemp is between -100 and 100
//       - throw an `Exception` with message 'Temperature must be between -100 and 100'
//     - setter for currentTemp must ensure currentTime is not in the future
//       - throw an `Exception` with message 'Current time cannot be in the future'
//    - setter for sunrise must ensure sunrise is on the same day as currentTemp and not after sunrise
//      - throw an `Exception` with message 'Sunrise must be on the same day as current time' for the former
//      - throw an `Exception` with message 'Sunrise cannot be after sunset' for the latter
//    - setter for sunset must ensure sunset is on the same day as currentTemp and not before sunrise
//      - throw an `Exception` with message 'Sunset must be on the same day as current time' for the former
//      - throw an `Exception` with message 'Sunset cannot be before sunset' for the latter

//  - Must have a generative constructor with required named params for each of the members

//  - Must have a factory constructor that accepts a single `dynamic` data param representing the OpenWeather data object for the current weather
//    - The method must parse out the required fields for the generative constructor and use the generative constructor to produce the object to return

//  - Must override the `toString()` method to return a string in the following format:
//    - `City: <city>, Description: <description>, Current Temperature: <currentTemp>, Current Time: <currentTime>, Sunrise: <sunrise>, Sunset: <sunset>'` where the angle brackets/values must be replaced with the actual member values.

//  - **NOTE: you will need to think about validation for the sunrise and sunset members in the constructor and the setters, since one necessisarily relies of the value of the other.**