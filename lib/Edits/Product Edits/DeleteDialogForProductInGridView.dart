import 'package:asian_plaza/Homepage/ProductFetch.dart';

import 'package:flutter/material.dart';
class DeleteDialogForProductInGridView extends StatelessWidget {
  String docID,firstdocID,name;
  DeleteDialogForProductInGridView({this.docID,this.firstdocID,this.name});
  @override
  Widget build(BuildContext context) {
    return (
      AlertDialog(
      title:Text("Warning"),
      content:Text('Are you sure you want to delete this Product ?$docID and $firstdocID, and $name'),
      actions:[
        FlatButton(
          child: Text('Yes'),
          onPressed: (){
            GetData().deleteProductData(docID:docID,firstdocID:firstdocID,name: name);
            Navigator.pop(context);
          },),
          FlatButton(
          child: Text('No'),
          onPressed: (){
            Navigator.pop(context);
          },)
      ]
    )
    );
  }
}