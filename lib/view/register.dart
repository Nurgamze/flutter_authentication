import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';


class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key, }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //statede controller tanımlanır

  final emailRegisterController=TextEditingController();
  final passwordRegisterController=TextEditingController();
  final adsoyadRegisterController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              SizedBox(height: 100,),
              //logo
              /*ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("assets/images/gh.jpeg",scale: 2.5,)
              ),*/
              Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("assets/images/gh.jpeg" )),
              ),              SizedBox(height: 10,),
              //welcome4
              Text("Kayıt ol", style: TextStyle(color: Colors.grey.shade700, fontSize: 16,),),
              SizedBox(height: 20,),
              //username
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: adsoyadRegisterController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Ad Soyad",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              //email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: emailRegisterController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  obscureText: true,
                  controller: passwordRegisterController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)

                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Şİfre",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      )
                  ),
                ),
              ),
              SizedBox(height: 20,),

              //sign in button
              GestureDetector(
                onTap:(){ },
                child: Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child:Center(
                      child: Text("Kayıt Ol",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),),

                    )
                ),
              ),
              SizedBox(height: 30,),
              //or continue with
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        //sool çizgisi
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Text("Birlikte aç"), //yazı
                    Expanded(
                      //sağ çizgi
                        child: Divider(thickness: 0.5,
                          color: Colors.grey,))
                  ],
                ),
              ),
              //google +apple sign in buttons
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius:BorderRadius.circular(15),
                          color: Colors.grey[200]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('assets/images/google.png',
                            height: 55
                        ),
                      )
                  ),
                  SizedBox(width: 10,),

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius:BorderRadius.circular(15),
                        color: Colors.grey[200]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset('assets/images/apple.png',
                          height: 55
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                      },
                      child: Text("Giriş Yap!",
                          style: TextStyle(
                              color: Colors.blue,fontWeight: FontWeight.bold
                          )
                      ))
                ],
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
