import 'package:driver_app/firebase_options.dart';
import 'package:driver_app/screens/other_screens/splash_screen.dart';
import 'package:driver_app/utils/colors.dart';
import 'package:driver_app/widgets/common/bottom_nav_bar.dart';
import 'package:driver_app/widgets/constants/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtil().init();
  try {
    print("HELLLOOO");
    await dotenv.load(fileName: ".env");
    print("loaded");
  } catch (e) {
    print('Error loading .env file: $e');
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Nukkad Foods Driver',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: colorBrightGreen),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const SplashScreen(),
        //home: BottomNavBar(),
      );
    });
  }
}
