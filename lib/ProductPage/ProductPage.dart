import 'package:asian_plaza/Homepage/ProductFetch.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class ProductPage extends StatefulWidget {
  String firstdocID;
  String docID;
  ProductPage({this.firstdocID,this.docID});
  @override
  _ProductPageState createState() => _ProductPageState(firstdocID:firstdocID,docID:docID);
}

class _ProductPageState extends State<ProductPage> {
  _ProductPageState({this.firstdocID,this.docID});
  String firstdocID,docID;
  
 final FirebaseAuth auth=FirebaseAuth.instance;
// bool state(){
//   final data= GetData().checkWishlist( docID , auth.currentUser.uid);
//   return data;
// }
  favorite(String firstdocID,String docID,String uid) {
    
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child:StreamBuilder(
          stream:GetData().productData(firstdocID, docID),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child:CircularProgressIndicator());

            }
            if(snapshot.hasData){              
              return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color:Colors.black),
            title:Text(snapshot.data.get('Name'),style:
             TextStyle( color: Colors.black,
                        fontSize: 20, fontWeight: FontWeight.bold),)
          ),
      body: ListView(children: [
        Column(
          children: [
            Stack(children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 190.0,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.8,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 500,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        image: DecorationImage(
                            image: NetworkImage(snapshot.data.get('Image')),
                            fit: BoxFit.fitHeight)),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // FutureBuilder(
                      //   future: GetData().checkWishlist(docID, auth.currentUser.uid),
                      //   builder: (context,snapshot){
                      //     IconButton(
                      //     icon: snapshot.data.documents.get("state")==true
                      //         ? Icon(Icons.favorite_border)
                      //         : Icon(
                      //             Icons.favorite,
                      //             color: Colors.red[900],
                      //           ),
                      //     onPressed: () {
                      //       // setState(() {
      
                      //       //             if () {
                      //       //                GetData().wishlistSave(firstdocID, docID, auth.currentUser.uid);        
                      //       //                 } else {
                      //       //               GetData().wishlistDelete(docID, auth.currentUser.uid);    
                      //       //                        }
                      //       //            });
                      //     });
                          
                      //   },
                      //   )
                      
                    ]),
              )
            ]),
            Divider(color: Colors.black),
            Text(
              "Description",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.data.get("Description")),
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.attach_money,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        label: new Text(
          snapshot.data.get('Price').toString(),
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        onPressed: null,
      ),
              );
          }}
        )
        );
  }
}
