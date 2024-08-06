import 'package:driver_app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../location_screens/location_screen.dart';

class BenefitsScreen extends StatefulWidget {
  BenefitsScreen({super.key});

  @override
  State<BenefitsScreen> createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen> {
  final List<String> benefits = [
    'Benefit 1: Free Rides',
    'Benefit 2: Discounts',
    'Benefit 3: Priority Support',
    'Benefit 4: Exclusive Offers'
  ];

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LocationScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGreen,
      body: Column(
        children: [
          SizedBox(height: 60), // Add some spacing at the top
          Text(
            'Benefits For You',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20), // Add some spacing below the title
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: benefits.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: colorLightGray,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                          height:
                              10), // Add spacing between inner container and text
                      Text(
                        benefits[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16), // Increase font size and color
                        textAlign: TextAlign.center, // Center align the text
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
