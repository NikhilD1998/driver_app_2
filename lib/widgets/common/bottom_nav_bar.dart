import 'package:driver_app/screens/authentication_screens/profile_screen.dart';
import 'package:driver_app/screens/home_screens/home_screen.dart';
import 'package:driver_app/screens/other_screens/wallet_screen.dart';
import 'package:driver_app/screens/profile/profile_screen.dart';
import 'package:driver_app/screens/report_screens/report_screen.dart';
import 'package:driver_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ReportScreen(),
    WalletScreen(),
    MyProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: SvgPicture.asset(
              'assets/svgs/order.svg',
              color: _selectedIndex == 0 ? colorGreen : colorGray,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/analytics.svg',
              color: _selectedIndex == 1 ? colorGreen : colorGray,
            ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/wallet.svg',
              color: _selectedIndex == 2 ? colorGreen : colorGray,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/profile.svg',
              color: _selectedIndex == 3 ? colorGreen : colorGray,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: colorGreen,
        unselectedItemColor: colorGray,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Business Screen'),
      ),
    );
  }
}
