import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quantapp/pages/registerpage.dart';
import 'package:quantapp/widgets/customdailog.dart';

import '../pages/home.dart';

class AuthController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const RegisterPage();
          }
        });
  }

  signInWithGoogle() async {
      CustomFullScreenDialog.showDialog();
    // Trigger the authentication flow
    try{final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
         if(googleUser  ==  null){
            CustomFullScreenDialog.cancelDialog();
         }
         else{
          firebaseAuth.signOut();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

     await FirebaseAuth.instance.signInWithCredential(credential);
     CustomFullScreenDialog.cancelDialog();}
     Get.to(HomePage());
         }
   
     catch(e){
      Get.snackbar(e.toString(), "message",duration: Duration(seconds: 15));
     }
  }
  signOut() {
    GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
    Get.to(RegisterPage());
  }

}