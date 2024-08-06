import 'package:driver_app/widgets/common/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/font-styles.dart';
import '../../widgets/common/custom_phone_field.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/common/full_width_green_button.dart';
import '../../widgets/common/transition_to_next_screen.dart';
import 'forgot_password.dart';
import 'signup_screen.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isSigningIn = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  Future<void> _signIn() async {
    if (_isSigningIn) return;

    setState(() {
      _isSigningIn = true;
    });

    final String contact = _mobileNumberController.text.trim();
    final String password = _passwordController.text.trim();

    if (contact.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Please fill all required fields"),
      ));
      setState(() {
        _isSigningIn = false;
      });
      return;
    }

    try {
      final String baseUrl = dotenv.env['BASE_URL']!;
      final response = await http.post(
        Uri.parse('$baseUrl/auth/DeliveryBoylogin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'contact': contact,
          'password': password,
        }),
      );

      final responseBody = json.decode(response.body);

      if (response.statusCode == 200 && responseBody['executed']) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Center(
            child: Text(responseBody['message']),
          ),
        ));
        Navigator.of(context).push(
          transitionToNextScreen(BottomNavBar()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(responseBody['message'] ?? 'Login failed'),
          ),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Center(
          child: Text('An error occurred: $e'),
        ),
      ));
    } finally {
      setState(() {
        _isSigningIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: extraLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                CustomPhoneField(
                  (value) {},
                  controller: _mobileNumberController,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  label: 'PASSWORD',
                  controller: _passwordController,
                  isObscured: _isPasswordObscured,
                  icon: IconButton(
                    icon: Icon(
                      _isPasswordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: colorBrightGreen,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(transitionToNextScreen(ForgotPasswordScreen()));
                  },
                  child: Center(
                      child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: mediumSmall,
                      color: colorBrightGreen,
                    ),
                  )),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: FullWidthGreenButton(
                      label: 'SIGN IN',
                      onPressed: _signIn,
                      isLoading: _isSigningIn,
                    ),
                  ),
                ),
                SizedBox(height: 80),
                Center(
                  child: Text(
                    'Have not listed with us yet?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: medium,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FullWidthGreenButton(
                          label: 'REGISTER',
                          onPressed: () {
                            Navigator.of(context)
                                .push(transitionToNextScreen(SignupScreen()));
                          })),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  'Sign in with',
                  style: TextStyle(color: colorGray, fontSize: mediumSmall),
                )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/googlelogo.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/facebooklogo.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/twitterlogo.png'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
