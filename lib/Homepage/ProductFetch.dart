import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';




class GetData{
  final data=  FirebaseFirestore.instance;
  StorageReference firebaseStorageRef = FirebaseStorage.instance.ref();

  //Stream Function for Product categories (Not shorted)
  Stream<QuerySnapshot> productCategories(){    
    final docs=data.collection("Products").snapshots();
        return docs;
     }

      //Future Function for adding Product Category
      Future addProductCategory(String cateName)async{
       await data.collection("Products").doc(cateName).collection("Product Details").doc().set({
         "Dummy":cateName,
         });
      
         
      }
      //Adding Product data 
      Future addProductData(String name,String brandName,String price,String description,File _image,var snapshotdata,)async{
        final imageData=firebaseStorageRef.child('Product Images').child(snapshotdata).child('$name.jpg');
        final StorageUploadTask task=imageData.putFile(_image);
        final url= await(await task.onComplete).ref.getDownloadURL();
       final getting= await data.collection('Products').doc(snapshotdata).collection("Product Details").doc();
               getting .set({
          "Name":name,
          "Brand":brandName,
          "Price":price,
          "Image":url,
          "Description":description,
          
        });
      }
      //Delete Product Data From GridView
      Future deleteProductData({String docID ,String firstdocID,String name})async{
          data.collection("Products").doc(firstdocID).collection("Product Details").doc(docID).delete();
          print(name);
         await firebaseStorageRef.child("Product Images").child(firstdocID).child("$name.jpg").delete();
         print('DOne');
      }
      //Delete Product Category
      void deleteProductCategory(String reference){
        data.collection("Slide Data").doc(reference).delete();
      }
      // Saving wishlist data
      void wishlistSave(String firstdocID,String docID,String uid){
        data.collection("Wishlist").doc(uid).collection(docID).doc("data").set({
          "firstdocID":firstdocID,
          "docID":docID,
        });
      }

      // Deleting Wishlist data
      void wishlistDelete(String docID,String uid){
        data.collection("Wishlist").doc(uid).collection(docID).doc('data').delete();
      }
      // to check the item is in wishlist or not
      Future checkWishlist(String docID,String uid){
       return data.collection("Wishlist").doc(uid).collection(docID).doc('data').get();
      }
      //Stream product page data
      Stream productData(String firstdocID,String docID){
        
       final productdata=  data.collection("Products").doc(firstdocID).collection("Product Details").doc(docID).snapshots();
       
       return productdata;
      }

     
     

  //Stream Function for product after shorted based on categories
  Stream<QuerySnapshot> productFetching(String categoryName){   
    Firebase.initializeApp();   
    Stream<QuerySnapshot> qs= data.collection('Products').doc(categoryName).collection('Product Details').snapshots();
    return qs;
  }

  //Stream Function for Slide..
  Stream<QuerySnapshot> getSlide(){    
    Firebase.initializeApp();
   Stream<QuerySnapshot > qs= data.collection('Slide Data').snapshots();
   return qs;
  }
  // Future Function for adding Slide Image and Title
  Future addSlideData(String title, File image )async{     
   final imageData=firebaseStorageRef.child("SlideImage").child("$title.jpg");
                final StorageUploadTask task=imageData.putFile(image);
               final url=  await (await task.onComplete).ref.getDownloadURL();
   await data.collection('Slide Data').doc().set({
      'Title':title,
      "Image":url,
      
    });
  }
  // Future SlideData(String title,File _image)async{
  //  final imageData=firebaseStorageRef.child("$title.jpg");
  // // final  task= imageData.updateMetadata(_image);
  // }

  //Future Function for Deleting of Slide
  Future deleteSlideData( String docID,String title)async{     
   await data.collection("Slide Data").doc( docID ).delete();
   await firebaseStorageRef.child("SlideImage").child("$title.jpg").delete();
    
  }

 
  
}
