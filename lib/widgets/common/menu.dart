import 'package:driver_app/screens/other_screens/nukkad_manager_screen.dart';
import 'package:driver_app/utils/colors.dart';
import 'package:driver_app/widgets/home/menu_item.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorWhite,
      ),
      width: double.infinity,
      margin: EdgeInsets.only(top: 10), // Adjust margin as needed
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Accessibility',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuItem(
                iconPath: 'assets/images/book.png',
                label: 'Complains',
                screen: NukkadManagerScreen(),
              ),
              MenuItem(
                iconPath: 'assets/images/info.png',
                label: 'Help Centre',
                screen: NukkadManagerScreen(),
              ),
              MenuItem(
                iconPath: 'assets/images/manager.png',
                label: 'Your\nmanager',
                screen: NukkadManagerScreen(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuItem(
                iconPath: 'assets/images/dollars.png',
                label: 'Payouts',
                screen: NukkadManagerScreen(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
