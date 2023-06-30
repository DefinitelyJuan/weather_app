import 'package:geolocator/geolocator.dart';

class Location{
  double? latitude;
  double? longitude;

  Future<void> getLocation() async{
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();
    print(position);
    latitude = position.latitude;
    longitude = position.longitude;

  }

}
