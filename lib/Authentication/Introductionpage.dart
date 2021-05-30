import 'package:asian_plaza/Authentication/signin-up%20design.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> { 

 
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
          child: IntroductionScreen(
            dotsDecorator: DotsDecorator(
              color:Colors.grey,
              activeColor:Colors.white,
            ),
            pages: [
              PageViewModel(
                    decoration: PageDecoration(boxDecoration: BoxDecoration(
                  color:Colors.cyan[600],
                )),
            titleWidget:Text("Comprehensive List of Products",style: TextStyle(color:Colors.white,fontSize: 25,),textAlign:TextAlign.center,),
            //image: Image.asset("assets/intro/standing.jpg"),
            bodyWidget: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(child: Text(" Pool of items under one roof and offer people an easy access.",style:TextStyle(color:Colors.white,fontSize: 15,),textAlign:TextAlign.center,)),
            )
            ),
              PageViewModel(
                decoration: PageDecoration(boxDecoration: BoxDecoration(
                  color:Colors.deepOrange[600],
                )),
               titleWidget:Text("Find Local Stores",style:TextStyle(color:Colors.white,fontSize: 25,)),
                //  footer: Text("Make your Shopping more Better and Secure",style:TextStyle(color: Colors.white)),
                bodyWidget: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(child: Text("Based on your location, Snap Up App shows local stores of various categories around you.",style:TextStyle(color:Colors.white,fontSize: 15,),textAlign:TextAlign.center)),
                )
                
              ),
             PageViewModel(
               decoration: PageDecoration(boxDecoration: BoxDecoration(
                  color:Colors.orange[600],
                )),
            titleWidget: Center(child: Text("Order Smartly and Avoid Confusions",style: TextStyle(color:Colors.white,fontSize: 25,),textAlign:TextAlign.center)),
           // image: Image.asset("assets/intro/makeiteasy.png"),
            bodyWidget:Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(child: Text("Avoid the order confusions and mismatches that generally happen over a phone call or in online shopping. Now, confirm all order specifications and modifications on the app, and get only the perfect.",style:TextStyle(color:Colors.white,fontSize: 15,),textAlign:TextAlign.center)),
            )
                ),
                      
              
            ],
            showSkipButton: true,
            showNextButton: true,
            onSkip: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UiDesign(uiType:true)));
            },
             onDone: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UiDesign(uiType:true)));
             },
             next: Text('Next',style: TextStyle(color:Colors.white,),),
             skip: Text('Skip',style: TextStyle(color:Colors.white,),),
              done: Text("Done",style: TextStyle(color:Colors.white,),),
              ),
    );
  }
}