import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hefish/auth/loginScreen.dart';
import 'package:hefish/auth/registerScreen.dart';
import 'package:hefish/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
      routes: {
        '/login': (context) => loginScreen(),
        '/register': (context) => registerScreen(),
      },
    );
  }
}
