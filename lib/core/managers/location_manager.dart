
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController{

  /// The Current location for the user with init value
  LatLng currentLocation = LatLng(12.3682265169693, 76.6509528432083);
  @override
  void onInit() {
    //getCurrentLocation();
    super.onInit();
  }

  void getCurrentLocation()async {
    bool serviceEnabled;
    LocationPermission permission;

    /// Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    var location =  await Geolocator.getCurrentPosition();
    currentLocation = LatLng(location.latitude, location.longitude);
    update();
  }

}