import 'package:asian_plaza/Edits/Product%20Edits/ProductShowtoEdits.dart';
import 'package:asian_plaza/Edits/SlideshowtoEdit.dart';
import 'package:flutter/material.dart';
class HomepageEdit extends StatefulWidget {
  @override
  _HomepageEditState createState() => _HomepageEditState();
}

class _HomepageEditState extends State<HomepageEdit> {
  @override
  Widget build(BuildContext context) {
    return Material(
      
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color:Colors.black),
              backgroundColor:Colors.white,
              title:Text("Edit Page",style:TextStyle(color: Colors.black))
            ),
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
        children:[
            Center(
              child:Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children:[
                  SizedBox(
                    height:150,
                    width: 150,
                    child:RaisedButton(color: Colors.grey[300],
                    child: Center(child: Text("Slides",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold))),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SlideEdit()));

                    },
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                    )
                  ),
                   SizedBox(
                    height:150,
                    width: 150,
                    child:RaisedButton(color: Colors.grey[300],
                    child: Center(child: Text("Products",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductCategory()));

                    },
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                    )
                  )
                 

                ]
              )
            )
        ]
      ),
          ),
    );
  }
}