import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hama_apps/config/color_config.dart';
import 'package:hama_apps/firebase_options.dart';
import 'package:hama_apps/helper/notification_helper.dart';
import 'package:hama_apps/page/awal_page.dart';
import 'package:hama_apps/page/home_page.dart';
import 'package:hama_apps/page/info_page.dart';

import 'package:hama_apps/page/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await NotificationHelper.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashPage(),
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primaryColor: ColorConfig.primary,
          colorScheme: const ColorScheme.light(
              primary: ColorConfig.primary, secondary: ColorConfig.secondary)),
      routes: {
        '/home': (context) => const HomePage(),
        '/awal': (context) => const AwalPage(),
        '/info': (context) => const InfoPage()
      },
    );
  }
}
