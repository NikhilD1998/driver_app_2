import 'package:driver_app/controller/delivery_boy_controller/delivery_boy_controller.dart';
import 'package:driver_app/controller/delivery_boy_controller/get_delivery_boy_by_id_model.dart';
import 'package:driver_app/screens/authentication_screens/signin_screen.dart';
import 'package:driver_app/screens/profile/about_screen.dart';
import 'package:driver_app/screens/profile/edit_profile_screen.dart';
import 'package:driver_app/utils/colors.dart';
import 'package:driver_app/utils/font-styles.dart';
import 'package:driver_app/widgets/constants/shared_preferences.dart';
import 'package:driver_app/widgets/constants/show_snack_bar_extension.dart';
import 'package:driver_app/widgets/constants/strings.dart';
import 'package:driver_app/widgets/profile/menu_item.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  GetDeliveryBoyByIdModel? deliveryBoy;
  bool isDeliveryBoyInfoLoaded = false;

  @override
  void initState() {
    super.initState();
    getDeliveryBoyInfo();
  }

  getDeliveryBoyInfo() async {
    setState(() {
      isDeliveryBoyInfoLoaded = false;
    });
    var userId = SharedPrefsUtil().getString(AppStrings.userId) ?? "";
    var userResult = await DeliveryBoyController.getDeliveryBoyById(
        context: context, id: userId);
    userResult.fold((String text) {
      setState(() {
        isDeliveryBoyInfoLoaded = true;
        context.showSnackBar(message: text);
      });
    }, (GetDeliveryBoyByIdModel user) {
      setState(() {
        deliveryBoy = user;
        isDeliveryBoyInfoLoaded = true;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (ModalRoute.of(context)?.isCurrent == true) {
        // Call your function here
        getDeliveryBoyInfo();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'Profile',
              style: TextStyle(
                fontSize: veryLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            !isDeliveryBoyInfoLoaded
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : deliveryBoy == null || deliveryBoy!.deliveryBoy == null
                    ? Container(
                        color: Colors.white,
                        child: Center(
                          child: Text('No user found'),
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            height: 180,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/avatarf.png',
                                  ),
                                  radius: 40,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  deliveryBoy!.deliveryBoy?.name ??
                                      "Name not available",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: large,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(32),
                            width: double.infinity,
                            color: colorWhite,
                            child: Column(
                              children: [
                                ProfileMenuItem(
                                  label: 'Edit Profile',
                                  iconPath: 'assets/svgs/edit.svg',
                                  screen: EditProfileScreen(
                                    deliveryBoy: deliveryBoy!.deliveryBoy!,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Divider(),
                                SizedBox(height: 4),
                                ProfileMenuItem(
                                  label: 'Work preference',
                                  iconPath: 'assets/svgs/work.svg',
                                  screen: AboutScreen(),
                                ),
                                SizedBox(height: 4),
                                Divider(),
                                SizedBox(height: 4),
                                ProfileMenuItem(
                                  label: 'About',
                                  iconPath: 'assets/svgs/info.svg',
                                  screen: AboutScreen(),
                                ),
                                SizedBox(height: 4),
                                Divider(),
                                SizedBox(height: 4),
                                ProfileMenuItem(
                                  label: 'Send Feedback',
                                  iconPath: 'assets/svgs/feedback.svg',
                                  screen: AboutScreen(),
                                ),
                                SizedBox(height: 4),
                                Divider(),
                                SizedBox(height: 4),
                                ProfileMenuItem(
                                  label: 'Report',
                                  iconPath: 'assets/svgs/flag.svg',
                                  screen: AboutScreen(),
                                ),
                                SizedBox(height: 4),
                                Divider(),
                                SizedBox(height: 4),
                                ProfileMenuItem(
                                  label: 'Logout',
                                  iconPath: 'assets/svgs/logout.svg',
                                  screen: SignInScreen(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
