import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home/dashboard_home.dart';
import 'home/slots_details.dart';
import 'home/total_earning.dart';
import 'home/total_per_day.dart';
import 'home/total_spaces.dart';
import 'login.dart';
import 'my_theme.dart';

//import 'home/login/ui/screens/intro_screen.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAkNGy9x8LP_6VzFAsF-ypif9zTyIgqC2E",
          authDomain: "authDomain",
          databaseURL:
              "https://smart-parking-397c4-default-rtdb.asia-southeast1.firebasedatabase.app/",
          // 👈
          projectId: "projectId",
          storageBucket: "storageBucket",
          messagingSenderId: "messagingSenderId",
          appId: "appId"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String routName = "jnb,";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Home',
      theme: MyTheme.lightTheme,
      // home: const MyHomePage(title: 'easy_sidemenu Demo'),
      debugShowCheckedModeBanner: false,
      routes: {
        Login.routName: (_) => Login(),
        // MyTimer.routName:  (_)=>MyTimer(),
        TotalSpaces.routName: (_) => TotalSpaces(),
        Totalnumberperday.routName: (_) => Totalnumberperday(),
        SlotsDetails.routName: (_) => SlotsDetails(),
        TotalEarning.routName: (_) => TotalEarning(),
        MyHomePage.routName: (_) => MyHomePage(title: 'easy_sidemenu Demo')
      },
      initialRoute: Login.routName,
    );
  }
}
