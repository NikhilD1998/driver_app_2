import 'dart:io';
import 'dart:convert';

import 'package:driver_app/screens/authentication_screens/work_preference_screen.dart';
import 'package:driver_app/widgets/common/full_width_green_button.dart';
import 'package:driver_app/widgets/common/grey_container.dart';
import 'package:driver_app/widgets/common/transition_to_next_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colors.dart';
import '../../utils/font-styles.dart';

class DocumentationScreen extends StatefulWidget {
  const DocumentationScreen({super.key});

  @override
  State<DocumentationScreen> createState() => _DocumentationScreenState();
}

class _DocumentationScreenState extends State<DocumentationScreen> {
  int? _selectedIdentityProof;
  File? _imageIdentityProof;
  File? _imagePanCard;
  File? _imageAddressProof;
  String? _downloadURLIdentityProof;
  String? _downloadURLPanCard;
  String? _downloadURLAddressProof;

  void _handleIdentityProofChange(int? value) {
    setState(() {
      _selectedIdentityProof = value;
    });
  }

  Future<void> _pickImage(String type) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File? selectedImage;
      String? downloadURL;

      if (type == 'idProofPic') {
        selectedImage = File(pickedFile.path);
        setState(() {
          _imageIdentityProof = selectedImage;
        });
      } else if (type == 'pancardPic') {
        selectedImage = File(pickedFile.path);
        setState(() {
          _imagePanCard = selectedImage;
        });
      } else if (type == 'drivingLicensePic') {
        selectedImage = File(pickedFile.path);
        setState(() {
          _imageAddressProof = selectedImage;
        });
      }

      // Upload image to Firebase Storage
      try {
        // AuthProvider authProvider =
        //     Provider.of<AuthProvider>(context, listen: false);

        // await authProvider.signInWithEmailAndPassword();
        // final ref = FirebaseStorage.instance
        //     .ref()
        //     .child('images/${type}_${DateTime.now().toString()}');
        // await ref.putFile(selectedImage!);
        // downloadURL = await ref.getDownloadURL();

        downloadURL = 'https:/download/url/png';

        if (type == 'idProofPic') {
          setState(() {
            _downloadURLIdentityProof = downloadURL;
          });
        } else if (type == 'pancardPic') {
          setState(() {
            _downloadURLPanCard = downloadURL;
          });
        } else if (type == 'drivingLicensePic') {
          setState(() {
            _downloadURLAddressProof = downloadURL;
          });
        }

        // Store URL in shared preferences
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setString(type, downloadURL);
        await saveUserInfoKeyValue(type, downloadURL);

        print(downloadURL);
      } catch (e) {
        print('Error uploading image: $e');
      }
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
          'Documentation',
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
                            color: colorGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 70,
                      color: Color(0xFFB8B8B8),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Color(0xFFB8B8B8),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: mediumSmall,
                            color: Color(0xFFB8B8B8),
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
                    'Work\nPreferances',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: small,
                      color: Color(0xFFB8B8B8),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'IDENTITY PROOF',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GreyContainer(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: medium,
                          ),
                        ),
                        Text('Choose one as a proof of identity'),
                        SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Radio<int>(
                          value: 0,
                          groupValue: _selectedIdentityProof,
                          onChanged: _handleIdentityProofChange,
                          activeColor: colorGreen,
                        ),
                        Text(
                          'Aadhar Card',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20),
                        Radio<int>(
                          value: 1,
                          groupValue: _selectedIdentityProof,
                          onChanged: _handleIdentityProofChange,
                          activeColor: colorGreen,
                        ),
                        Text(
                          'Voter ID Card',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Front side photo of your Aadhar card with your clear name and photo',
                      style: TextStyle(
                        color: Color(
                          0xFFB8B8B8,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      // onPressed: () async {
                      //   // Open file picker
                      //   FilePickerResult? result =
                      //       await FilePicker.platform.pickFiles();

                      //   if (result != null) {
                      //     // File picked successfully
                      //     String? filePath = result.files.single.path;
                      //     print('File path: $filePath');
                      //     // Add further logic for what to do with the file
                      //   } else {
                      //     // User canceled the picker
                      //     print('User canceled file picker');
                      //   }
                      // },
                      onPressed: () => _pickImage('idProofPic'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: colorGreen),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: colorGreen,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Upload Photo',
                            style: TextStyle(color: colorGreen),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'PAN CARD',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GreyContainer(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '2.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: medium,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Front side photo of your Aadhar card\nwith your clear name and photo',
                          style: TextStyle(
                            color: Color(
                              0xFFB8B8B8,
                            ),
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      // onPressed: () async {
                      //   // Open file picker
                      //   FilePickerResult? result =
                      //       await FilePicker.platform.pickFiles();

                      //   if (result != null) {
                      //     // File picked successfully
                      //     String? filePath = result.files.single.path;
                      //     print('File path: $filePath');
                      //     // Add further logic for what to do with the file
                      //   } else {
                      //     // User canceled the picker
                      //     print('User canceled file picker');
                      //   }
                      // },
                      onPressed: () => _pickImage('pancardPic'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: colorGreen),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: colorGreen,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Upload Photo',
                            style: TextStyle(color: colorGreen),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'DRIVING LICENSE',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GreyContainer(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '3.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: medium,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Front side photo of your Driving license\ncard with your clear name and photo',
                          style: TextStyle(
                            color: Color(
                              0xFFB8B8B8,
                            ),
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      // onPressed: () async {
                      //   // Open file picker
                      //   FilePickerResult? result =
                      //       await FilePicker.platform.pickFiles();

                      //   if (result != null) {
                      //     // File picked successfully
                      //     String? filePath = result.files.single.path;
                      //     print('File path: $filePath');
                      //     // Add further logic for what to do with the file
                      //   } else {
                      //     // User canceled the picker
                      //     print('User canceled file picker');
                      //   }
                      // },
                      onPressed: () => _pickImage('drivingLicensePic'),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: colorGreen),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: colorGreen,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Upload Photo',
                            style: TextStyle(color: colorGreen),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FullWidthGreenButton(
                  label: 'NEXT',
                  onPressed: () {
                    Navigator.of(context)
                        .push(transitionToNextScreen(WorkPreferenceScreen()));
                  }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
