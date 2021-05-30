import 'package:asian_plaza/Homepage/ProductFetch.dart';

import 'package:flutter/material.dart';
class DeleteDialogForProductCategoryAndForSlide extends StatelessWidget {
  String docID,title;
  DeleteDialogForProductCategoryAndForSlide({this.docID,this.title});
  @override
  Widget build(BuildContext context) {
    return (
      AlertDialog(
      title:Text("Warning"),
      content:docID==null?Text('Do you want to delete this whole Product Category ?'):Text('Are you sure you want to delete this slide ?'),
      actions:[
        FlatButton(
          child: Text('Yes'),
          onPressed: (){
            docID==null?GetData().deleteProductCategory(docID):GetData().deleteSlideData(docID,title);
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