import 'package:driver_app/screens/authentication_screens/registration_complete_screen.dart';
import 'package:driver_app/widgets/common/full_width_green_button.dart';
import 'package:driver_app/widgets/common/grey_borderd_container.dart';
import 'package:driver_app/widgets/common/grey_container.dart';
import 'package:driver_app/widgets/common/transition_to_next_screen.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../utils/colors.dart';
import '../../utils/font-styles.dart';

class WorkPreferenceScreenTwo extends StatefulWidget {
  const WorkPreferenceScreenTwo({super.key});

  @override
  State<WorkPreferenceScreenTwo> createState() =>
      _WorkPreferenceScreenTwoState();
}

class _WorkPreferenceScreenTwoState extends State<WorkPreferenceScreenTwo> {
  String? _selectedValue; // Define this in your State class
  String? _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedValue = 'bike'; // Initialize with a default value if needed
  }

  Future<void> _saveuserInfo() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_selectedValue != null) {
      // await prefs.setString('selected_vehicle', _selectedValue!);
      await saveUserInfoKeyValue('selected_vehicle', _selectedValue!);
    }
    if (_selectedType != null) {
      // await prefs.setString('workTimings', _selectedType!);
      await saveUserInfoKeyValue('workTimings', _selectedType!);
    }

    print("save user info-------------");
  }

  Future<bool> signupDeliveryBoy() async {
    print("---- In signup delivery--------");

    // Retrieve the user information as a JSON string
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userInfoStr = prefs.getString('user_info');

    // Parse the JSON string into a Map
    Map<String, dynamic> userInfo =
        userInfoStr != null ? jsonDecode(userInfoStr) : {};

    // Extract values from the userInfo map
    String? name = userInfo['name'];
    String? email = userInfo['email'];
    String? contact = userInfo['contact'];
    String? password = userInfo['password'];
    String? city = userInfo['city'];
    bool? referred = userInfo['referred'];
    String? firstName = userInfo['firstName'];
    String? middleName = userInfo['middleName'];
    String? lastName = userInfo['lastName'];
    int? gender = userInfo['gender'];
    String? dob = userInfo['DOB'];
    String? whatsappContact = userInfo['whatsappContact'];
    String? alternateNumber = userInfo['alternateNumber'];
    String? IFSCCode = userInfo['IFSCCode'];
    String? branchCode = userInfo['branchCode'];
    String? accountNumber = userInfo['accountNumber'];
    String? idProofPic = userInfo['idProofPic'];
    String? pancardPic = userInfo['pancardPic'];
    String? drivingLicensePic = userInfo['drivingLicensePic'];
    String? locationName = userInfo['locationName'];
    String? description = userInfo['description'];
    String? workTimings = userInfo['workTimings'];

    // Add other required fields similarly...

    print("step 1");

    Map<String, dynamic> deliveryBoyData = {
      "name": name,
      "email": email,
      "contact": contact,
      "password": password,
      "city": "indore",
      "isReferred": referred ?? false,
      "firstName": firstName,
      "middleName": middleName,
      "lastName": lastName,
      "gender": gender,
      "DOB": dob,
      "whatsappContact": whatsappContact,
      "alternateNumber": alternateNumber,
      "bankDetails": {
        "IFSCCode": IFSCCode,
        "branchCode": branchCode,
        "accountNumber": accountNumber
      },
      "idProofPic": idProofPic,
      "pancardPic": pancardPic,
      "drivingLicensePic": drivingLicensePic,
      "workPreference": [
        {
          "locationName": locationName,
          "description": description,
        }
      ],
      "workTimings": [workTimings],
    };

    print(deliveryBoyData);
    print("step 2");

    final baseUrl = dotenv.env['BASE_URL']!;

    try {
      print("step 3");
      final response = await http.post(
        Uri.parse('$baseUrl/auth/DeliveryBoysignup'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(deliveryBoyData),
      );

      print("step 4");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        if (responseData['executed']) {
          print("Delivery boy added successfully");
          return true;
        } else {
          print("Failed to add deliveryyyyyy boy: ${responseData['message']}");
          return false;
        }
      } else {
        print("Failed to add delivery boy: ${response.reasonPhrase}");
        return false;
      }
    } catch (error) {
      print("Error: $error");
      return false;
    }
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
                'VEHICLE',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Select your vehicle type'),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  GreyBorderdContainer(
                    child: RadioListTile(
                      activeColor: colorGreen,

                      title: Text('Bike/Scooter'),
                      secondary: Image.asset('assets/images/bike.png'),
                      value: 'bike', // Provide a unique value for each option
                      groupValue:
                          _selectedValue, // Use a variable to track the selected value
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  GreyBorderdContainer(
                    child: RadioListTile(
                      title: Text('Electric Vehicle'),
                      secondary: Image.asset('assets/images/ev.png'),
                      value: 'ev', // Provide a unique value for each option
                      activeColor: colorGreen,
                      groupValue:
                          _selectedValue, // Use a variable to track the selected value
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'WORK TIMINGS',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      GreyBorderdContainer(
                        child: RadioListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Full time',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: medium,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: colorGreen,
                                  ),
                                  Text(
                                    ' 8-10 hours',
                                    style: TextStyle(
                                      color: colorDarkGray,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Image.asset('assets/images/moneylogo.png'),
                                  Text(
                                    ' Upto ₹10,000 weekly earnings',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          activeColor: colorGreen,

                          value:
                              'full_time', // Unique value for full-time option
                          groupValue: _selectedType, // Track selected option
                          onChanged: (value) {
                            setState(() {
                              _selectedType = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      GreyBorderdContainer(
                        child: RadioListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Part time',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: medium,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: colorGreen,
                                  ),
                                  Text(
                                    ' 4-6 hours',
                                    style: TextStyle(
                                      color: colorDarkGray,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Image.asset('assets/images/moneylogo.png'),
                                  Text(
                                    ' Upto ₹6,000 weekly earnings',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          activeColor: colorGreen,
                          value:
                              'part_time', // Unique value for part-time option
                          groupValue: _selectedType, // Track selected option
                          onChanged: (value) {
                            setState(() {
                              _selectedType = value;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              FullWidthGreenButton(
                  label: 'NEXT',
                  onPressed: () async {
                    await _saveuserInfo();
                    bool success = await signupDeliveryBoy();
                    if (success) {
                      Navigator.of(context).push(
                        transitionToNextScreen(RegistrationCompleteScreen()),
                      );
                    } else {
                      // Optionally, show an error message to the user
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to sign up. Please try again.'),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
