import 'package:asian_plaza/Homepage/ProductFetch.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatelessWidget {
  final _key=GlobalKey<FormState>();
  var cateName;
  void checkAndSave(){
    var form = _key.currentState;
    if(form.validate()){
      form.save();
      GetData().addProductCategory(cateName);
      
    
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color:Colors.black),
        title:Text("Add Category",style: TextStyle(fontSize:20,color: Colors.black),)
      ),
      body: Container(
        child:ListView(children: [
          Form(
        key: _key,
        child: Column(
          children:[
            TextFormField(
              onSaved: (value)=>cateName=value,
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
               hintText: "Category Name",
               icon:Icon(Icons.title,color: Colors.black,)
             ),
            )
          ]
        ),
      ),
      Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              SizedBox(width: 200,height: 50,
              child: RaisedButton.icon(color: Colors.grey[300],onPressed: (){
                 checkAndSave();            
                 Navigator.pop(context);         
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