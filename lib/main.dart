import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stepping_stone_app/screens/home_screen.dart';
import 'package:stepping_stone_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) => MaterialApp(
        title: 'Stepping Ston',
        theme: ThemeData(primarySwatch: Colors.grey),
        initialRoute: '/home',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home':(context) => HomeScreen()
        },
      ),
    );
  }
}
