import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../../utils/colors.dart';
import 'intro_screen.dart';
import '../authentication_screens/signin_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Set up the timer to navigate to the appropriate screen after 3 seconds
    Timer(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

      if (isFirstLaunch) {
        // Set 'isFirstLaunch' to false so that IntroScreen won't be shown again
        await prefs.setBool('isFirstLaunch', false);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => IntroScreen(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
        );
      }
    });

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: colorGray,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 8,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
