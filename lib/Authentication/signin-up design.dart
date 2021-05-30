import 'package:asian_plaza/Authentication/FirebaseAuth.dart';
import 'package:asian_plaza/Authentication/VerifyingPage.dart';
import 'package:asian_plaza/Homepage/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class UiDesign extends StatefulWidget {
  bool uiType=true;

  UiDesign({this.uiType});

  @override
  _UiDesignState createState() => _UiDesignState(uiType);
}

class _UiDesignState extends State<UiDesign> {

 bool uiType;

  _UiDesignState(this.uiType);
  bool suffix1=false;

  bool obscureText1= true;

  String password,email;

  final _key = GlobalKey<FormState>();
  final scaffoldKey=GlobalKey<ScaffoldState>();


  String validatorEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "Invalid Email";
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length > 0 && value.length < 8) {
      return "Password is to small";
    }
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }

  void onsaved(){
    final form=_key.currentState;
    if(form.validate()){
      form.save();
      return validateandSubmit(email,password);
    }
  }

  void validateandSubmit(String email,String password)async{
    if(uiType==true){
      try{
       scaffoldKey.currentState.showSnackBar(SnackBar(
           duration: Duration(seconds:3),
         content: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text("Signing In",style:TextStyle(color:Colors.white),),
             CircularProgressIndicator(
               backgroundColor:Colors.white,
             )
           ],
         ),
         backgroundColor: Color.fromRGBO(3, 24, 89, 1),
       ));
      await Authclass().signinWithEmail(email, password).then((uid){ 
        print("working");         
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage(uid: uid.uid,user: uid,)));
        
      }); 
      } catch(e){
      
        scaffoldKey.currentState.showSnackBar(SnackBar(
         content: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text("Password or User Name is invalid",style:TextStyle(color:Colors.white),),
             Icon(Icons.warning),
           ],
         ),
         backgroundColor: Color.fromRGBO(3, 24, 89, 1),
       ));
      }
    
    }
    else{
      try{
         scaffoldKey.currentState.showSnackBar(SnackBar(
           duration: Duration(seconds:3),
         content: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text("Verify your email",style:TextStyle(color:Colors.white),),
             CircularProgressIndicator(
               backgroundColor:Colors.white,
             )
           ],
         ),
         backgroundColor: Color.fromRGBO(3, 24, 89, 1),
       ));
      await Authclass().signupWithEmail(email, password).then((auth) =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage(uid: auth.uid,user: auth,))));     
      }catch(e){
       scaffoldKey.currentState.showSnackBar(SnackBar(
         content: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text("Something is wrong ",style:TextStyle(color:Colors.white),),
             Icon(Icons.warning),
           ],
         ),
         backgroundColor: Color.fromRGBO(3, 24, 89, 1),
       ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.black54
                  // image: DecorationImage(
                  //     image:widget.uiType==true? AssetImage('assets/Galbraith.jpeg'):AssetImage('assets/Galbraith1.jpeg'),
                  //     fit: BoxFit.fitWidth,
                  //     alignment: Alignment.topCenter)
                  ),
                  
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: widget.uiType==true?EdgeInsets.only(top: 200):EdgeInsets.only(top: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: ListView(
                  children: <Widget>[
                    Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(
                        widget.uiType==true?'Signin':'Signup',
                        style: TextStyle(
                          fontFamily: "Dosis",
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(3, 24, 89, 1),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 120),
                        child: Image(
                          image: AssetImage('assets/Logo/Tp.jpg'),
                          height: 70,
                        ),
                      ),
                    ]),
                    Form(
                        key: _key,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 8),
                              child: Container(
                                color: Color(0xfff5f5f5),
                                child: TextFormField(
                                  validator: validatorEmail,
                                  
                                  onSaved: (value)=>email=value,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Username",
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xfff5f5f5),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              child: Container(
                                color: Color(0xfff5f5f5),
                                child: TextFormField(
                                  validator: validatePassword,
                                  onSaved: (value)=>password=value,
                                  obscureText: obscureText1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                      prefixIcon: Icon(Icons.lock_outline),
                                      
                                      suffixIcon: GestureDetector(
                                        child: suffix1 == true
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off),
                                        onTap: () {
                                          setState(() {
                                            if (suffix1 == false) {
                                              suffix1 = true;
                                              obscureText1 = false;
                                            } else {
                                              suffix1 = false;
                                              obscureText1 = true;
                                            }
                                          });
                                        }),
                                      labelStyle: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ),
                            uiType==true?Container():Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                              child: Container(
                                color: Color(0xfff5f5f5),
                                child: TextFormField(
                                  validator: validatePassword,
                                  onSaved: (value)=>password=value,
                                  obscureText: obscureText1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: ' Confirm Password',
                                      prefixIcon: Icon(Icons.lock_outline),
                                      
                                      suffixIcon: GestureDetector(
                                        child: suffix1 == true
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off),
                                        onTap: () {
                                          setState(() {
                                            if (suffix1 == false) {
                                              suffix1 = true;
                                              obscureText1 = false;
                                            } else {
                                              suffix1 = false;
                                              obscureText1 = true;
                                            }
                                          });
                                        }),
                                      labelStyle: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Center(
                          child: MaterialButton(
                        onPressed: () {
                          onsaved();
                        },
                        child: Text(
                          uiType==true?"SIGN IN":"SIGN UP",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        color: Color.fromRGBO(3, 24, 89, 1),
                        height: 50,
                        minWidth: 400,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      )),
                    ),
                    uiType==true?Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(
                        child: GestureDetector(
                          onTap: (){},
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ):Container(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(uiType==true?"Don't have an account ? ":"Have an account ? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  )),
                            ),
                            GestureDetector(
                                onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UiDesign(uiType:uiType==true?false:true)));

                                },
                                child: Text(uiType==true?"sign up":"sign in",
                                    style: TextStyle(
                                      color: Color.fromRGBO(242, 92, 5, 1),
                                      fontSize: 15,
                                    )))
                          ]),
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                        )),
                        Text(
                          "Social SignIn",
                          style: TextStyle(fontSize: 15),
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                        ))
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: ()async{
                              try{
                             await   Authclass().signinWithGmail().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage(user: value,)))) ;
                                 scaffoldKey.currentState.showSnackBar(SnackBar(
           duration: Duration(seconds:3),
         content: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text("Signing Up",style:TextStyle(color:Colors.white),),
             CircularProgressIndicator(
               backgroundColor:Colors.white,
             )
           ],
         ),
         backgroundColor: Color.fromRGBO(3, 24, 89, 1),
       ));
       
                              }catch(e){
                                scaffoldKey.currentState.showSnackBar(SnackBar(
         content: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text("Something is wrong ",style:TextStyle(color:Colors.white),),
             Icon(Icons.warning),
           ],
         ),
         backgroundColor: Color.fromRGBO(3, 24, 89, 1),
       ));
                              }
                                                                 
                        
                        
                      },
                            child: Image(
                              image: AssetImage('assets/Logo/Gmail.png'),
                              height: 50,
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: GestureDetector(
                        //     onTap: (){
                            
                        //     },
                        //     child: Image(
                        //       image: AssetImage('assets/Logo/Facebook.png'),
                        //       height: 50,
                        //     ),
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}