


import 'package:asian_plaza/Edits/DeleteAlertDialog.dart';
import 'package:asian_plaza/Edits/SlideshowEdit.dart';
import 'package:asian_plaza/Homepage/ProductFetch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
class SlideEdit extends StatefulWidget {
  @override
  _SlideEditState createState() => _SlideEditState();
}

class _SlideEditState extends State<SlideEdit> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child:  Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[300],
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SlideEditandNew()));
          },
        child:Icon(Icons.add,color: Colors.black,),
        
        ),
        appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme:IconThemeData(color: Colors.black),
        title:Text("Slide Items",style: TextStyle(color: Colors.black),)
      ),
      body:  StreamBuilder(
        stream: GetData().getSlide(),
        initialData: CircularProgressIndicator(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting)
         return Center(child:CircularProgressIndicator());
         if(snapshot.hasData){
           print("has data");
           print(snapshot.data.documents.length);
            return ListView.separated(
            itemCount: snapshot.data.documents.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
           itemBuilder: (context,index){
             
             return Container(
               height: 100,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 image: DecorationImage(image: NetworkImage(snapshot.data.documents[index].get('Image')),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5),BlendMode.dstATop) )),
               child: Dismissible(
                 key: Key(snapshot.data.documents[index].get('Title')),
                 onDismissed: (direction){

                 },
                 confirmDismiss: (direction)async{  
                         print(snapshot.data.documents[index].reference.documentID);         
                   final result = await showDialog(context: context,builder:(context)=>DeleteDialogForProductCategoryAndForSlide(docID:snapshot.data.documents[index].reference.documentID,title:snapshot.data.documents[index].get("Title")));
                   return result;
                 },
                 background: Container(
                   color:Colors.red,
                   padding:EdgeInsets.only(left:12),
                   child:Align(child: Icon(Icons.delete,color: Colors.white,),
                    alignment: Alignment.centerLeft,
                   ),
                 ),
                 child: ListTile(
                   title:Text('Title: ${snapshot.data.documents[index].get('Title')}')
                 ),
               ),
             );
           },
         );
       
         }
       },
        

      ),
      ),
    );
  }
}






     