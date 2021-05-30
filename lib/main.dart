import 'package:asian_plaza/Authentication/Introductionpage.dart';

import 'package:asian_plaza/Homepage/Homepage.dart';
import 'package:asian_plaza/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashScreen',
      routes:{
        
       'intropage':(context)=>IntroPage(),
       'splashScreen':(context)=>SplashScreen(),
       'homepage':(context)=>Homepage()
      },
      home: SplashScreen(),
    );
  }
}