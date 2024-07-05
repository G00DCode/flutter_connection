import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocation extends StatefulWidget {
  const GeoLocation({super.key});

  @override
  State<GeoLocation> createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> {
  double? latitude;
  double? longitude;
  String location = "";

  get_user_location() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location has been denied");
      LocationPermission ask_permission = await Geolocator.requestPermission();
    } else {
      Position current_position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude = current_position.latitude;
      longitude = current_position.longitude;

      List<Placemark> place_marks = await placemarkFromCoordinates(latitude!, longitude!);
      location = "${place_marks[0].locality}, ${place_marks[0].administrativeArea}, ${place_marks[0].postalCode}, ${place_marks[0].country}";

      setState(() {}); // Update the UI with the new location data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get User Location'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: get_user_location,
              child: Text("Get Location"),
            ),
            if (latitude != null && longitude != null) ...[
              Text("Latitude: $latitude"),
              Text("Longitude: $longitude"),
              Text("$location"),
            ],
          ],
        ),
      ),
    );
  }
}
