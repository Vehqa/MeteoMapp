import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocation() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      var status = await Geolocator.checkPermission();
      if (status == LocationPermission.denied) {
        status = await Geolocator.requestPermission();
      }
      if (status == LocationPermission.deniedForever) {
        //Text d'information
      }
      if (status == LocationPermission.whileInUse ||
          status == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
        );
        print(position);
      }
    } else {
      // Texte d'information : Activer votre services de Geolocalisation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Récupérer la position'),
        ),
      ),
    );
  }
}
