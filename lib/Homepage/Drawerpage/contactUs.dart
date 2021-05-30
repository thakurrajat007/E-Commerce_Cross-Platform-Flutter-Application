import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  
  String phoneNumber='+1 (206) 658-3307';
  String _launchUrl='https://www.facebook.com/nepalimarket1';
  String _launchUrl2='https://www.instagram.com/bdasianplaza/?hl=en';
  String _launchUrl3='https://nepaliasianmarket.weebly.com/';
  Future<void>_launchInBrowser(String url)async{
    if(await canLaunch(url)){
      await launch(url,
      forceSafariVC:true,
      forceWebView:true,
      enableJavaScript: true,
      headers: <String,String>{
        'my_header_key':'my_header_value'
      }
      );
    }else{
     throw'Could not launch $url'; 
    }
  }
  Future<void>_makePhoneCall(String url)async{
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Could not Launch";
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home:SafeArea(
                  child: Scaffold(
    appBar:AppBar(
      iconTheme:IconThemeData(color:Colors.black,),
    title:Center(child: Text("Contact Us",style: TextStyle(color:Colors.black),)),
    backgroundColor: Colors.white,),
    body: Column(
      children:[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _launchInBrowser(_launchUrl);
                    });
                  },
                  child: Image(image: AssetImage("assets/Logo/facebook.png"),height: 50,)),
                Padding(
                  padding: const EdgeInsets.only(left:30.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _launchInBrowser(_launchUrl2);
                      });
                    },
                    child: Image(image: AssetImage("assets/Logo/Instagram.png"),height: 50,)),
                ),
                
            ],),
          ),
          Column(
            
            children:[
              Padding(
           padding: const EdgeInsets.all(12.0),
           child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("About",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
           ],),
         ) ,
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Row(
            mainAxisAlignment:MainAxisAlignment.start,
            children:[
                Icon(Icons.web_asset),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child:Text("https://nepaliasianmarket.weebly.com".trim(),style: TextStyle(color:Colors.blue),),
                    onTap: (){
                      _launchInBrowser(_launchUrl3);
                    },
                  ),
                )
            ]
          ),
              ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.phone,size: 24,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(child: Text("+1 (206) 658-3307",style: TextStyle(color:Colors.blue),),
                onTap: (){
                  _makePhoneCall(phoneNumber);
                },),
              )
            ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children:[
                Icon(Icons.access_time,size: 24,),
                Padding(padding: const EdgeInsets.all(8.0),
                child:Text("09:30 - 19:00"),
                ),
                 
              ]
            ),
          ),
            Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[
                Icon(Icons.info_outline,size: 24,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 335,
                    decoration: BoxDecoration(
                     // border:Border.all(color:Colors.black)
                    ),
                    child:Text("B & D Asian Plaza is all about helping you make the right decision about the right fresh produce & grocery support with daily use ethnic items & dresses",textAlign: TextAlign.left,softWrap: true,)
                  ),
                )
                ]))
            ]
          ),
          Card(
            
            elevation: 15,
            color: Colors.blueAccent,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                gradient:LinearGradient(
                  colors:[Colors.grey,Colors.blueGrey],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.5, 0.5),
                  
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children:[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("3091 W Galbraith Rd \nCincinnati,OH,US 45239",style: TextStyle(fontWeight:FontWeight.bold,fontSize:18),),
                  )
                ]
          ),
              ),
            ),)
          
          
         
         
      ]
    ),
          ),
        )
      );
  }
}