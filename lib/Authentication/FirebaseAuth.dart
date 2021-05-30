import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authclass{   
  final database=FirebaseFirestore.instance;
final FirebaseAuth _auth=FirebaseAuth.instance;
final GoogleSignIn googleSignIn=GoogleSignIn();

Future<User> signupWithEmail(String email,String password)async{
  var usersignup= await(_auth.createUserWithEmailAndPassword(email: email, password: password));
    database.collection("Wishlist").doc(usersignup.user.uid).set({"UID":usersignup.user.uid});
    return usersignup.user;
}



Future<User> signinWithEmail(String email,String password)async{       
  final usersignin=await(_auth.signInWithEmailAndPassword(email: email, password: password));
   return usersignin.user;
}


void logoutWithEmail(){
   _auth.signOut();
  FirebaseAuth.instance.signOut();
}
Future<User> signinWithGmail()async{
  
GoogleSignInAccount googleSignInAccount=await googleSignIn.signIn();
GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
AuthCredential credential=GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
final  authResult=await _auth.signInWithCredential(credential);
final User user=authResult.user;
 database.collection("Wishlist").doc(user.uid).set({"UID":user.uid});
return user;
}



void signoutWithGamil(){
 _auth.signOut();
   googleSignIn.signOut();
}

}