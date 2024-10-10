import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:moviesapp2/screens/HomePage.dart';
import 'package:moviesapp2/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAy64QOZoOJiiCxdMRh7_0c8S-dGKQNTS0",
          appId: "1:629324455701:android:96eea8e90336f761cc531c",
          messagingSenderId: "",
          projectId: "movieapp-d4ea2",
          storageBucket: "movieapp-d4ea2.appspot.com"));
  SharedPreferences sp = await SharedPreferences.getInstance();
  runApp(MyApp());

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Qsplash(),
      //MyHomePage(),
    );
  }
}


