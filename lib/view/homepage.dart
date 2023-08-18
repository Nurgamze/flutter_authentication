import 'package:authentication/services/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hoşgeldin ${FirebaseAuth.instance.currentUser!.displayName}"),
            Text(" ${FirebaseAuth.instance.currentUser!.email}"),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              _authService.signOut();
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            },
                child: Text("LOG OUT")
            )
          ],
        ),
      ),
    );
  }
}
