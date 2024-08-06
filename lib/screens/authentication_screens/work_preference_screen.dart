import 'package:driver_app/screens/authentication_screens/work_preference_screen_two.dart';
import 'package:driver_app/widgets/common/full_width_green_button.dart';
import 'package:driver_app/widgets/common/transition_to_next_screen.dart';
import 'package:driver_app/widgets/sigin_signup/work_area_container.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/font-styles.dart';
import 'dart:convert';

class WorkPreferenceScreen extends StatefulWidget {
  const WorkPreferenceScreen({super.key});

  @override
  State<WorkPreferenceScreen> createState() => _WorkPreferenceScreenState();
}

class _WorkPreferenceScreenState extends State<WorkPreferenceScreen> {
  String? selectedArea;
  String? selectedDescription;

  Future<void> _saveWorkPreferences() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    if (selectedArea != null) {
      // await prefs.setString('locationName', selectedArea!);
      // await prefs.setString('description', selectedDescription!);
      await saveUserInfoKeyValue('locationName', selectedArea!);
      await saveUserInfoKeyValue('description', selectedDescription!);
    }
  }

  void _onAreaSelected(Map<String, String> selection) {
    setState(() {
      selectedArea = selection['area'];
      selectedDescription = selection['description'];
    });
  }

  Future<void> saveUserInfoKeyValue(String key, dynamic value) async {
    Map<String, dynamic> newData = {key: value};
    await saveUserInfo(newData);
  }

  Future<void> saveUserInfo(Map<String, dynamic> newData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userInfoStr = prefs.getString('user_info');
    Map<String, dynamic> userInfo =
        userInfoStr != null ? jsonDecode(userInfoStr) : {};
    userInfo.addAll(newData);
    await prefs.setString('user_info', jsonEncode(userInfo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: Text(
          'Work Preferences',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorGreen,
                        border: Border.all(
                          width: 2,
                          color: colorGreen,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: mediumSmall,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 70,
                      color: colorGreen,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorGreen,
                        border: Border.all(
                          width: 2,
                          color: colorGreen,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: mediumSmall,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 70,
                      color: colorGreen,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: colorGreen,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: mediumSmall,
                            color: colorGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Personal\nInformation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: small,
                      color: colorGreen,
                    ),
                  ),
                  Text(
                    'Documentation',
                    style: TextStyle(
                      fontSize: small,
                      color: colorGreen,
                    ),
                  ),
                  Text(
                    'Work\nPreferences',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: small,
                      color: colorGreen,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'WORK AREA',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Select the area you want to work in'),
              SizedBox(
                height: 30,
              ),
              WorkAreaContainer(
                area: 'South tukoganj',
                description: 'Upto ₹10,000 weekly earnings',
                selectedArea: selectedArea,
                onAreaSelected: _onAreaSelected,
              ),
              SizedBox(
                height: 20,
              ),
              WorkAreaContainer(
                area: 'Area 2',
                description: 'Upto ₹15,000 weekly earnings',
                selectedArea: selectedArea,
                onAreaSelected: _onAreaSelected,
              ),
              SizedBox(
                height: 20,
              ),
              WorkAreaContainer(
                area: 'Area 3',
                description: 'Upto ₹12,000 weekly earnings',
                selectedArea: selectedArea,
                onAreaSelected: _onAreaSelected,
              ),
              SizedBox(
                height: 20,
              ),
              WorkAreaContainer(
                area: 'Area 4',
                description: 'Upto ₹8,000 weekly earnings',
                selectedArea: selectedArea,
                onAreaSelected: _onAreaSelected,
              ),
              SizedBox(
                height: 20,
              ),
              WorkAreaContainer(
                area: 'Area 5',
                description: 'Upto ₹11,000 weekly earnings',
                selectedArea: selectedArea,
                onAreaSelected: _onAreaSelected,
              ),
              SizedBox(
                height: 30,
              ),
              FullWidthGreenButton(
                  label: 'NEXT',
                  onPressed: () async {
                    await _saveWorkPreferences();
                    Navigator.of(context).push(
                        transitionToNextScreen(WorkPreferenceScreenTwo()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
