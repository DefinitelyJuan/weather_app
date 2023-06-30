import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  double? longitude;
  double? latitude;
  void initState(){
    super.initState();
  }

  Future<void> getData() async {
    Location location = Location();
    await location.getLocation();
    longitude = location.longitude;
    latitude = location.latitude;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            await getData();
          },
          child: Text("Get Location"),
        ),
      ),
    );
  }
}
