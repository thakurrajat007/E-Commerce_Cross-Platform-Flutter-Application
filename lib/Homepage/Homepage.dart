

import 'package:asian_plaza/Edits/HomepageEdit.dart';
import 'package:asian_plaza/Homepage/GridBasedItems/GridListView.dart';
import 'package:asian_plaza/Homepage/ProductFetch.dart';
import 'package:asian_plaza/ProductPage/ProductPage.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:asian_plaza/Homepage/Drawerpage/Drawerpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Homepage extends StatefulWidget {
  String uid;
  User user;
  GoogleSignIn googleSignIn;

  Homepage({this.uid, this.googleSignIn, this.user});
  @override
  _HomepageState createState() =>
      _HomepageState(googleSignIn: googleSignIn, uid: uid, user: user);
}

class _HomepageState extends State<Homepage> {
  _HomepageState({this.googleSignIn, this.uid, this.user});
  String uid;
  User user;
  GoogleSignIn googleSignIn;
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
            backgroundColor: Colors.white70,
            key: _key,
            appBar: AppBar(
              backgroundColor: Colors.black54,
              title: Text(
                "Snap Up",
                style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  _key.currentState.openDrawer();
                },
              ),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
            ),
            
            drawer:Theme(
           data: Theme.of(context).copyWith(
                 canvasColor: Colors.brown[50], //This will change the drawer background to blue.
                 //other styles

                 
              ),
              child: Drawer(
              
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Drawerpage(
                  user: user,
                  uid: uid,
                  //googleSignIn: googleSignIn,
                ),
              ),
            ),
              ),
              
            
            
            
            
            
            body: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(user);
                        },
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  )),
                              child: Center(child: Icon(Icons.menu,size: 35,)),
                            ),
                            Text("All")
                          ],
                        )),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image(
                                  image: AssetImage(
                                      'assets/homepage/Fashion.png'),
                                ),
                              ),
                            ),
                            Text("Fashion")
                          ],
                        )),
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image(
                                  image: AssetImage('assets/homepage/Vintage.png'),
                                  height: 25,
                                ),
                              ),
                            ),
                            Text("Vintage")
                          ],
                        )),
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image(
                                  image:
                                      AssetImage('assets/homepage/Mushroom.png'),
                                      height: 25,
                                ),
                              ),
                            ),
                            Text("Vegetable")
                          ],
                        )),
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image(
                                  image: AssetImage(
                                      'assets/homepage/Phone.png'),
                                      height: 25,
                                ),
                              ),
                            ),
                            Text("Electronic")
                          ],
                        )),
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image(
                                  image:
                                      AssetImage('assets/homepage/Dinner.png'),
                                      height: 25,
                                ),
                              ),
                            ),
                            Text("Food")
                          ],
                        )),
                      ),
                    ]),
              ),
              StreamBuilder(
                stream: GetData().getSlide(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());
                  else if (snapshot.hasData) {
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 170.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 900),
                        viewportFraction: 0.8,
                      ),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 400,
                          width: 500,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              image: DecorationImage(
                                  image: NetworkImage(snapshot
                                      .data.documents[index]
                                      .get('Image')),
                                  fit: BoxFit.fitWidth)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data.documents[index].get("Title"),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ]),
                        );
                      },
                    );
                  }
                  return CircularProgressIndicator();
                },
                
              ),
              Padding(padding: EdgeInsets.only(top:12)),
              


























// StreamBuilder(
                
//                 stream:GetData().productCategories(),
//                 builder: (context,snapshot){
//                   if(snapshot.connectionState==ConnectionState.waiting){
//                     return Center(child: CircularProgressIndicator(),);
//                   }
//                   else if(snapshot.hasData){
//                     return 
//                        ListView.builder(
//                          shrinkWrap: true,
//                          physics: BouncingScrollPhysics(),
//                             itemCount:snapshot.data.documents.length,
//                             itemBuilder:(context,index){
//                               return
//                                 Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children:[
//                                         Text(snapshot.data.documents[index].reference.documentID,style: TextStyle(color: Colors.black,fontSize: 20)),
//                                         GestureDetector(child: Text("See All",style: TextStyle(color: Colors.blue,fontSize: 20))),
//                                       ]
//                                     ),
//                                     Padding(padding: EdgeInsets.only(top:12)),
//                                     StreamBuilder(
//                                       stream:GetData().productFetching(snapshot.data.documents[index].reference.documentID),
//                                       builder: (context,productsnapshot){
//                                         if(snapshot.connectionState==ConnectionState.waiting){
//                                           return Center(child: CircularProgressIndicator());
//                                         }
//                                         if(snapshot.hasData){
//                                           return Container(
//                                             height: 240,
//                                             child: ListView.builder(
//                                                shrinkWrap: true,
//                                               scrollDirection: Axis.horizontal,
//                                               itemCount:productsnapshot.data.documents.length,
//                                               itemBuilder:(context,productindex){
//                                                 return GestureDetector(
//                                                   child:SizedBox(
//                                                     child: Card(
//                                                       child: Column(
//                                                         children:[
//                                                           Center(
//                                                             child:Image.network(productsnapshot.data.documents[productindex].get("Image"))
//                                                           )
//                                                         ]
//                                                       ),
//                                                     ),
//                                                     )
//                                                 );
//                                               }
//                                             ),
//                                           );
//                                         }
//                                       },
//                                     )
//                                   ],
//                                 );
                              
//                             }
//                           );
                    
                    
//                   }
//                   return
//                 },
//               )








              StreamBuilder(
                stream: GetData().productCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return Container(
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                             shrinkWrap: true,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            snapshot.data.documents[index]
                                                .reference.documentID,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(
                                               12),
                                          child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            GridListView(
                                                                snapshot
                                                                    .data
                                                                    .documents[
                                                                        index]
                                                                    .reference
                                                                    .documentID,
                                                                false)));
                                              },
                                              child: Text(
                                                "See All",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.blue),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(
                                           10),
                                      child: Container(
                                          height: 210,
                                          child: StreamBuilder(
                                            stream: GetData().productFetching(
                                                snapshot.data.documents[index]
                                                    .reference.documentID),
                                            builder: (context, snapshotData) {
                                              if (snapshotData.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                              if (snapshotData.hasData) {
                                              //  print(snapshot.data.documents[index].reference.documentID.toString());
                                                return ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: snapshotData
                                                      .data.documents.length,
                                                  itemBuilder:
                                                      (context, indexsecond) {
                                                      //  print(snapshotData.data.documents[index].reference.documentID.toString());
                                                    return GestureDetector(
                                                      onTap: () {
                                                      // print(snapshot.data.documents[index].reference.documentID.toString());
                                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage(firstdocID: snapshot.data.documents[index]
                                                    .reference.documentID,docID:snapshotData.data.documents[indexsecond].reference.documentID.toString())));
                                                      },
                                                      child: Card(
                                                        elevation: 10,
                                                        child: Container(
                                                            width: 150,
                                                            child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            5.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                      height:
                                                                          130,
                                                                      child: Image.network(
                                                                          snapshotData
                                                                              .data
                                                                              .documents[indexsecond]
                                                                              .get('Image'),
                                                                          width: 140),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    snapshotData
                                                                        .data
                                                                        .documents[
                                                                            indexsecond]
                                                                        .get(
                                                                            'Brand'),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "\$" +
                                                                        (snapshotData
                                                                            .data
                                                                            .documents[indexsecond]
                                                                            .get('Price')),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    snapshotData.data.documents[indexsecond].get('Name').length<=15?snapshotData.data.documents[indexsecond].get('Name'):snapshotData.data.documents[indexsecond].get('Name').substring(0,15)+("..."),
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ])),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                          )),
                                    )
                                  ]);
                            })
                            );
                  }
                },
              )
            ]),
            

            floatingActionButton:(FirebaseAuth.instance.currentUser.uid=="nR3ni9ts3IWYAfY8QCR2zbnoTYw2")?FloatingActionButton(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomepageEdit()));
                }):Container(),
            ),
      ),
    );
  }
}
