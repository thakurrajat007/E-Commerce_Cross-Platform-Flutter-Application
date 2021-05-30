import 'package:asian_plaza/Authentication/FirebaseAuth.dart';

import 'package:asian_plaza/Authentication/signin-up%20design.dart';
import 'package:asian_plaza/Homepage/Drawerpage/contactUs.dart';
import 'package:asian_plaza/Homepage/Homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Drawerpage extends StatefulWidget {
  String uid;
  User user;
  GoogleSignIn googleSignIn;
  Drawerpage({this.uid,this.googleSignIn,this.user});
  @override
  _DrawerpageState createState() => _DrawerpageState(user: user,googleSignIn: googleSignIn,uid:uid);
}

class _DrawerpageState extends State<Drawerpage> {
  String uid;
  User user;
  GoogleSignIn googleSignIn;
  _DrawerpageState({this.user,this.googleSignIn,this.uid});
  @override
  Widget build(BuildContext context) {
    return ListView(

      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color:Colors.white60
          ),
          
          accountName: user.photoURL==null?Text('Hi There',style: TextStyle(color:Colors.black,fontSize: 17),):Text(user.displayName,style: TextStyle(color:Colors.black,fontSize: 17)),
          accountEmail: user.email==null?Text('null',style: TextStyle(color:Colors.black,fontSize: 15)):Text(user.email,style: TextStyle(color:Colors.black,fontSize: 15)),
          currentAccountPicture: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape:BoxShape.circle
            ),
            child: user.photoURL==null?Image(image: AssetImage('assets/Drawer Profile image/emptyprofile.webp')):Image.network(user.photoURL),)
        ),
        Divider(
          color: Colors.black,
          height: 20.0,
        ),
        ListTile(
          title: Text("Search",style: TextStyle(color:Colors.black,fontSize: 17)),
          leading: Icon(Icons.search,size: 30,),
          onTap: () {
            
          },
        ),
        ListTile(
          title: Text("Notifications",style: TextStyle(color:Colors.black,fontSize: 17)),
          leading: Icon(Icons.notifications,size: 30),
          onTap: () {
            
          },
        ),
        ListTile(
          title: Text("WishList",style: TextStyle(color:Colors.black,fontSize: 17)),
          leading: Icon(Icons.shopping_cart,size: 30),
          onTap: () {
            
          },
        ),
        ListTile(
          title: Text("Contact Us",style: TextStyle(color:Colors.black,fontSize: 17)),
          leading: Icon(Icons.contact_mail,size: 30),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUs()));
          },
        ),
        Divider(
          height: 20.0,
          color: Colors.black,
        ),
        ListTile(
          title: Text("Logout",style: TextStyle(color:Colors.black,fontSize: 17)),
          leading: Icon(Icons.person_outline,size: 30),
          onTap: () {
            try {
              if(user.displayName==null){
                Authclass().logoutWithEmail();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UiDesign()));
              }else{
                
                Authclass().signoutWithGamil();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UiDesign()));
              }
            } catch (e) {
              print(e);
            }
          },
        ),
      ],
    );
  }
}
