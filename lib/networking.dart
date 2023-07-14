import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelp {

  NetworkHelp(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
    else {
      print(response.statusCode);
      print('error');
    }

  }
  Future getWeatherSearched() async {
    final response = await http.get(Uri.parse(url));
    var firstStuff = jsonDecode(response.body);

    double latitude = firstStuff['coord']['lat'];
    double longitude = firstStuff['coord']['lon'];

    var newUrl = "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=ef7cc8cebcbb0e59326556672f3bdd2c";

    final result = await http.get(Uri.parse(newUrl));

    return result.body;
  }
}