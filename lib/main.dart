import 'package:flutter/material.dart';
import 'package:vibra/routes.dart';
import 'package:vibra/screens/splash/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:vibra/theme.dart';
// 
void main() {
 
  runApp(MyApp());
SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

class MyApp extends StatelessWidget {
  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VIBRA Chatting Application',
      theme: theme(),

      // home: SplashScreen(),
      // cancelled the previous line to easily modify the initial screen
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
