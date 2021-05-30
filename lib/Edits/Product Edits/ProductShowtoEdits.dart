import 'package:asian_plaza/Edits/DeleteAlertDialog.dart';
import 'package:asian_plaza/Edits/Product%20Edits/addProductCategory.dart';
import 'package:asian_plaza/Homepage/GridBasedItems/GridListView.dart';
import 'package:asian_plaza/Homepage/ProductFetch.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatefulWidget {
  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Scaffold(  
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[300],
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCategory()));
          },
          child:Icon(Icons.add,color: Colors.black,)
        ),      
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color:Colors.black),
          title:Text("Select Category",style:TextStyle(color: Colors.black,fontSize:20)),
        ),
        body: StreamBuilder(
          stream: GetData().productCategories(),
          builder:(context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      Padding(padding: EdgeInsets.all(6)),
                      SizedBox(
                        width:500,
                        height: 75,
                        child:RaisedButton(
                          color: Colors.grey[300],
                          elevation: 5,
                        onLongPress: (){
                          print('working');
                          showDialog(context: context,builder: (context)=>DeleteDialogForProductCategoryAndForSlide(title: snapshot.data.documents[index].reference.documentID,));
                        },
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>GridListView(snapshot.data.documents[index].reference.documentID,true)));
                        },
                        child: Text(snapshot.data.documents[index].reference.documentID,style: TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 20),),
                      )
                      ),
                      Padding(padding: EdgeInsets.all(6))
                    ],
                  );
                },

              );
            }
          }
        ),
        
        ),
    );
  }
}