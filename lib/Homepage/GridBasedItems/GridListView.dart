import 'package:asian_plaza/Edits/DeleteAlertDialog.dart';
import 'package:asian_plaza/Edits/Product%20Edits/DeleteDialogForProductInGridView.dart';
import 'package:asian_plaza/Edits/Product%20Edits/addproducts.dart';
import 'package:asian_plaza/Homepage/ProductFetch.dart';
import 'package:asian_plaza/ProductPage/ProductPage.dart';
import 'package:flutter/material.dart';
class GridListView extends StatefulWidget {
  var firstdocID;
  bool state;
  GridListView(this.firstdocID,this.state);
  @override
  _GridListViewState createState() => _GridListViewState(firstdocID,state);
}

class _GridListViewState extends State<GridListView> {
  _GridListViewState(this.firstdocID,this.state);
  var firstdocID;
  bool state;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SafeArea(
                  child: Scaffold(
                    floatingActionButton: state==true?FloatingActionButton(backgroundColor: Colors.grey[300],child: Icon(Icons.add,color:Colors.black),onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProducts(firstdocID)));
                    }):null,
    appBar:AppBar(title: Text(firstdocID,style: TextStyle(color:Colors.black),),
    backgroundColor: Colors.white,
    leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,), onPressed: (){
      Navigator.of(context).pop();
    }),),
    body: StreamBuilder(
      stream:GetData().productFetching(firstdocID),
      builder:(context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting)
                return Center(child:CircularProgressIndicator());
                if(snapshot.hasData){
                  return GridView.builder(
          itemCount: snapshot.data.documents.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.8),
           ),
           itemBuilder:(context,index){
             print(snapshot.data.documents[index].reference);
             return GestureDetector(
               onLongPress: (){
                 state==true?showDialog(context:context,builder: (context)=>DeleteDialogForProductInGridView(docID:snapshot.data.documents[index].reference.documentID,firstdocID: firstdocID,name: snapshot.data.documents[index].get('Name'),)):Container();
               },
               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage(firstdocID:firstdocID,docID:snapshot.data.documents[index].reference.documentID)));},
                              child: Container(
                 
                 child: Card(
                          elevation:10,
                          child:Column(
                            
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              height: 140,
                              child: Image.network(snapshot.data.documents[index].get('Image'),
                              width: 140),
                            ),
                          ),
                          Text(
                            snapshot.data.documents[index].get('Brand'),
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                         "\$ " +  ( snapshot.data.documents[index].get('Price')),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            snapshot.data.documents[index].get('Name'),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          
                        ]),
                        ),
               ),
             );
           } 
           );
                }
      }
    )
          ),
        ),
      );
  }
}