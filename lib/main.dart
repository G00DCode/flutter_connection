import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_connection/GeoLocator/geo_location.dart';
import 'package:flutter_connection/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(FlutterConnection());
}
class FlutterConnection extends StatelessWidget {

  const FlutterConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterConnection",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,

      ),
      home: GeoLocation(),

    );
  }
}


