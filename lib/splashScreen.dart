import 'dart:async';

import 'package:asian_plaza/Authentication/FirebaseAuth.dart';
import 'package:asian_plaza/Authentication/Introductionpage.dart';
import 'package:asian_plaza/Authentication/signin-up%20design.dart';
import 'package:asian_plaza/Homepage/Homepage.dart';
import 'package:asian_plaza/Homepage/ProductFetch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
   final user=FirebaseAuth.instance.currentUser;
   if (user == null) {
     Timer(
          Duration(seconds: 2),
          () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) =>
              IntroPage()
              ),
          ) 
        );
      } else {
        Timer(
          Duration(seconds: 2),
          () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) =>
                      Homepage(user:user,uid: user.uid),
              ),
              );
          },
        );
      }
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Image(image: AssetImage("assets/Logo/Tp.jpg"),),
          ]
        ),
        ),
      ),
    );
  }
}