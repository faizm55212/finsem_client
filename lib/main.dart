import 'package:finsem_client/controller/event_controller.dart';
import 'package:finsem_client/controller/user_controller.dart';
import 'package:finsem_client/ui/component/nav_bar.dart';
import 'package:finsem_client/ui/screens/dump.dart';
import 'package:finsem_client/ui/screens/home_screen/home_screen.dart';

import 'ui/screens/welcome_screens/welcome_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAppCheck.instance.activate();
  await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put<UserController>(UserController());
    Get.put<EventController>(EventController());
    return ScreenUtilInit(
      designSize: const Size(360, 705),
      builder: () => GetMaterialApp(
        title: 'FinSEM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: Dump(),
        home: const WelcomeScreen(),
      ),
    );
  }
}
