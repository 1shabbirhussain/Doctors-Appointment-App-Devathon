import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/firebase_options.dart';
import 'package:hackathon/login_Signup/login.dart';
import 'package:hackathon/login_Signup/signup.dart';
import 'package:hackathon/screens/appointmnetScreen.dart';
import 'package:hackathon/screens/homeScreenDevathon.dart';
import 'package:hackathon/screens/splashPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),

      home: homeScreenView(),
      // home: AppointmentScreen(),
      // home: SignUpScreen(),
    );
  }
}
