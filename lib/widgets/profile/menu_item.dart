import 'package:driver_app/screens/profile/about_screen.dart';
import 'package:driver_app/utils/font-styles.dart';
import 'package:driver_app/widgets/common/transition_to_next_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem(
      {super.key,
      required this.label,
      required this.iconPath,
      required this.screen});

  final String label;
  final String iconPath;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(transitionToNextScreen(screen));
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: mediumLarge,
              ),
            ),
            SvgPicture.asset(iconPath),
          ],
        ),
      ),
    );
  }
}
