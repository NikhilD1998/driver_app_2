import 'package:driver_app/screens/authentication_screens/profile_screen.dart';
import 'package:driver_app/utils/colors.dart';
import 'package:driver_app/utils/font-styles.dart';
import 'package:driver_app/widgets/common/full_width_green_button.dart';
import 'package:driver_app/widgets/common/transition_to_next_screen.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              'assets/images/buildings.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              textAlign: TextAlign.center,
              'Which city would you like to work in?',
              style: TextStyle(
                color: colorGreen,
                fontSize: extraLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Deliver food in your nearby location',
            style: TextStyle(
              fontSize: mediumLarge,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorLightGray,
                )),
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/locpin.png'),
                Text(
                  '  Indore',
                  style:
                      TextStyle(fontSize: medium, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FullWidthGreenButton(
                label: 'CONTINUE',
                onPressed: () {
                  Navigator.of(context).push(
                    transitionToNextScreen(
                      ProfileScreen(),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Change City?',
            style: TextStyle(
              color: colorGreen,
              fontSize: mediumSmall,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
