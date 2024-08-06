import 'package:driver_app/widgets/profile/about_menu_item.dart';
import 'package:flutter/material.dart';

import '../../utils/font-styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: medium),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            AboutMenuItem(
              label: 'Terms of Service',
            ),
            SizedBox(
              height: 20,
            ),
            AboutMenuItem(
              label: 'Privacy Policy',
            )
          ],
        ),
      ),
    );
  }
}
