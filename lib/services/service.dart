
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/homepage.dart';
import '../view/login.dart';

class AuthService{

  // 1. handleAuthState

  // 2. signInWıthGoogle

  // 3. signOut

  handleAuthState(){
    print("auth state içindeyim");
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context,snapshot){
         print("StreamBuilder içindeyim");
         if(snapshot.hasData){
           print("if içindeyim");

           return HomePage();
    } else{
          return  LoginPage();
    }
    });
  }

  signWithGoogle() async{
    //authenticatei tetikle
    final GoogleSignInAccount? googleUser= await GoogleSignIn(
      scopes: <String>["email"]).signIn();

    //kimlik doğrulama detaylarını requestten al
    final GoogleSignInAuthentication googleAuth= await googleUser!.authentication;

    //yeni kimlik bilgisi olustur

    final credential =GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    //kullanıcı açtıktan sonra kullanıcı
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

  //sign out
  signOut()  {
     FirebaseAuth.instance.signOut();
    // Kullanıcının çıkış yapması durumunda yönlendirme işlemi
  }
//otomatik oturum açmayı kapatıyor
  /*void signout() {
    GoogleSignIn().signOut();
  }*/

//emailpasswordlogin

Future<StreamBuilder> login(String? email, String? password) async{
  final auth=FirebaseAuth.instance;
  auth.createUserWithEmailAndPassword(
      email: email.toString(),
      password: password.toString()
  );
  return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,AsyncSnapshot<User?> snapshot){
        print("emaillll ${email} password ${password}");
        if(snapshot.hasData && snapshot.data!=null){
          return const HomePage();
        }else if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return LoginPage();

      });

}













 /* final FirebaseAuth _auth =FirebaseAuth.instance;

  Future<void> reqisterWithEmailAndPassword(String email,String password)  async{
    final user =await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
  }

  Future<void> signInWithEmailAndPassword(String email,String password)  async{
    final user =await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
  }*/








}