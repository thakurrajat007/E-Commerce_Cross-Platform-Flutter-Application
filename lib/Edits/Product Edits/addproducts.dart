import 'dart:io';

import 'package:asian_plaza/Homepage/ProductFetch.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AddProducts extends StatefulWidget {
  var snapshotdata;
  AddProducts(this.snapshotdata);
  @override
  _AddProductsState createState() => _AddProductsState(snapshotdata);
}

class _AddProductsState extends State<AddProducts> {
_AddProductsState(this.snapshotdata);
    var name,brandName,price,description;
    var snapshotdata;
    
 
  File _image;
  final picker=ImagePicker();
  
  Future getImage(bool check)async{
    final pickedFile=await picker.getImage(source: check==true?ImageSource.camera:ImageSource.gallery,imageQuality:50);
    setState(() {
      _image=File(pickedFile.path);
    });
    
  }
  final _key=GlobalKey<FormState>();
  void checkAndSave(File _image){
    var form = _key.currentState;
    if(form.validate()){
      form.save();
      
      GetData().addProductData(name, brandName, price, description, _image,snapshotdata,).whenComplete(() => Navigator.pop(context));
    
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Scaffold(appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color:Colors.black),
        title:Text("Add Product",style: TextStyle(color:Colors.black),)
      ),
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
              onSaved: (value)=>name=value,
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
               hintText: "Name",
               icon:Icon(Icons.create,color: Colors.black,)
             ),
            ),
            TextFormField(
              onSaved: (value)=>brandName=value,
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
               hintText: "Brand Name",
               icon:Icon(Icons.branding_watermark,color: Colors.black,)
             ),
            ),
            TextFormField(
              onSaved: (value)=>price=value,
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
             maxLength: 20,
             maxLines: 1,
             decoration: InputDecoration(
               enabledBorder: UnderlineInputBorder(
                 borderSide:BorderSide(color: Colors.black)
               ),
               hintText: "Price",
               icon:Icon(Icons.attach_money,color: Colors.black,)
             ),
            ),
            TextFormField(
              onSaved: (value)=>description=value,
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
             maxLength: 200,
             maxLines: 5,
             decoration: InputDecoration(
               enabledBorder: UnderlineInputBorder(
                 borderSide:BorderSide(color: Colors.black)
               ),
               hintText: "Description",
               icon:Icon(Icons.description,color: Colors.black,)
             ),
            ),
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
    )
    );
  }
}