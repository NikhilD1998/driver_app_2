import 'dart:convert';
import 'dart:typed_data';

import 'package:driver_app/controller/profile/profile_controller.dart';
import 'package:driver_app/screens/authentication_screens/referral_screen.dart';
import 'package:driver_app/utils/colors.dart';
import 'package:driver_app/widgets/common/custom_text_field.dart';
import 'package:driver_app/widgets/common/full_width_green_button.dart';
import 'package:driver_app/widgets/common/info_container.dart';
import 'package:driver_app/widgets/common/transition_to_next_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../../utils/font-styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _profilenameController = TextEditingController();

  File? _image;
  String? _downloadURLProfileImage;

  LocalController _getSavedData = LocalController();
  late Map<String, dynamic> userInfo;

  @override
  void initState() {
    super.initState();
    getUserData();
    _loadUserInfo();
    _addListeners();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userInfoStr = prefs.getString('user_info');
    if (userInfoStr != null) {
      Map<String, dynamic> userInfo = jsonDecode(userInfoStr);
      setState(() {
        _profilenameController.text = userInfo['name'] ?? '';
      });
    }
  }

  void _addListeners() {
    _profilenameController.addListener(
        () => saveUserInfoKeyValue('name', _profilenameController.text));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _profilenameController.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getUserData();
  // }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }

    // Upload image to Firebase Storage
    // try {
    //   AuthProvider authProvider =
    //       Provider.of<AuthProvider>(context, listen: false);

    //   await authProvider.signInWithEmailAndPassword();
    //   final ref = FirebaseStorage.instance
    //       .ref()
    //       .child('images/${DateTime.now().toString()}');
    //   await ref.putFile(_image!);
    //   final url = await ref.getDownloadURL();

    //   setState(() {
    //     _downloadURLProfileImage = url;
    //   });

    //   print(_downloadURLProfileImage);
    // } catch (e) {
    //   print('Error uploading image: $e');
    // }
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

  Future<void> getUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userDataString = prefs.getString('user_info');
      if (userDataString != null) {
        Map<String, dynamic> userData = jsonDecode(userDataString);
        setState(() {
          userInfo = userData;
          _profilenameController.text = userInfo['name'] ?? '';
        });
      }
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  void routeReferral() async {
    if (_profilenameController.text.isNotEmpty) {
      // var addData = {
      //   'name': _profilenameController.text,
      // };
      await saveUserInfoKeyValue('name', _profilenameController.text);
      Navigator.of(context).push(transitionToNextScreen(ReferralScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: colorBrightRed, content: Text("Name is required")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'LET’S GET STARTED!',
              style: TextStyle(
                fontSize: medium,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'YOUR PROFILE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: large,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: colorWhite, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Choose how people will see your stall',
                    style: TextStyle(
                      color: colorGray,
                      fontSize: mediumSmall,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: colorGreen,
                            ),
                            borderRadius: BorderRadius.circular(60)),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              _image != null ? FileImage(_image!) : null,
                          child:
                              _image == null ? Icon(Icons.add_a_photo) : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    label: 'YOUR NAME',
                    controller: _profilenameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InfoContainer(
                      message:
                          'This is the name and picture that customers will see on the app.')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FullWidthGreenButton(
                label: 'GET STARTED', onPressed: routeReferral),
          ],
        ),
      ),
    );
  }
}
