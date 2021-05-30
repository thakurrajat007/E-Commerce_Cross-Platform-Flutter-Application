


import 'dart:io';

import 'package:asian_plaza/Homepage/ProductFetch.dart';


import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class SlideEditandNew extends StatefulWidget {
  @override
  _SlideEditandNewState createState() => _SlideEditandNewState();
}

class _SlideEditandNewState extends State<SlideEditandNew> {
  
  
  var title;
 
  File _image;
  final picker=ImagePicker();
  
  Future getImage(bool check)async{
    final pickedFile=await picker.getImage(source: check==true?ImageSource.camera:ImageSource.gallery,imageQuality: 50);
    setState(() {
      _image=File(pickedFile.path);
    });
    
  }
  final _key=GlobalKey<FormState>();
  void checkAndSave(File _image){
    var form = _key.currentState;
    if(form.validate()){
      form.save();
      
      GetData().addSlideData(title,_image).whenComplete(() => Navigator.pop(context));
    
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
      
      appBar:AppBar(
        iconTheme: IconThemeData(color:Colors.black),
        backgroundColor: Colors.white,
        title: Text("Add Slide",style: TextStyle(color:Colors.black),)),
      body: Container(
        child:ListView(children: [

         
          SizedBox(
                         height: 200,                              
                      child:_image==null?Container(child:Center(child: Icon(Icons.add),)):Image.file(_image,height: 200,width: 250,),
                    ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              IconButton(icon: Icon(Icons.add_a_photo),
               onPressed: (){
                 getImage(true);
               }),
               Padding(padding: EdgeInsets.all(12)),
               IconButton(icon: Icon(Icons.add_photo_alternate),
               onPressed: (){
                 getImage(false);
               })
            ],
          ) , 
                
          Padding(padding: EdgeInsets.all(10),
          child: Form(
        key: _key,
        child: Column(
          children:[
            TextFormField(
              onSaved: (value)=>title=value,
              validator: (value){
                if(value.isEmpty){
                  return "Can't be empty";}
                  else{
                    return null;
                  }
                
              },
              style: TextStyle(
                                    fontSize: 20,
                                  ),
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
           
             cursorColor: Colors.black,
             maxLength: 30,
             maxLines: 1,
             decoration: InputDecoration(
               enabledBorder: UnderlineInputBorder(
                 borderSide:BorderSide(color: Colors.black)
               ),
               hintText: "Title",
               icon:Icon(Icons.title,color: Colors.black,)
             ),
            )
          ]
        ),
      ),
          
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              SizedBox(width: 200,height: 50,
              child: RaisedButton.icon(color: Colors.grey[300],onPressed: (){
                 checkAndSave(_image);            
                          
              },
               icon: Icon(Icons.save), label:Text('Create')),)
            ]
          )

          
        ],)
      )
      ),
    );
  }
}