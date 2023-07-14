import 'package:flutter/material.dart';
import 'networking.dart';
import 'constants.dart';

void main() => runApp(CityScreen());

class CityScreen extends StatelessWidget {
  CityScreen({super.key});

  String city = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Look for your city'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/city_background.jpg'), fit: BoxFit.cover)),
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    onChanged: (text) {
                      city = text;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your city name',
                    )),
                GestureDetector(
                  onTap: () async {
                    var oNetWorking = NetworkHelp("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=ef7cc8cebcbb0e59326556672f3bdd2c");
                    var weatherData = await oNetWorking.getWeatherSearched();
                    Navigator.pop(context, weatherData);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                      width: 200,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Search",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}