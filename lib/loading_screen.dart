import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location.dart';
import 'location_screen.dart';
import 'networking.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  double? longitude;
  double? latitude;
  var locationWeather;
  void initState(){
    super.initState();
  }

  Future<void> getData() async {
    Location location = Location();
    await location.getLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    locationWeather = await NetworkHelp("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=ef7cc8cebcbb0e59326556672f3bdd2c").getData();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            await getData();
            Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: locationWeather)));
          },
          child: Text("Get Location"),
        ),
      ),
    );
  }
}
