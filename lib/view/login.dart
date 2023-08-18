import 'package:authentication/services/service.dart';
import 'package:authentication/view/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, }) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //statede controller tanımlanır

  AuthService _authService= AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? email;
  String? password;


  @override
  Widget build(BuildContext context) {
     email=emailController.text;
     password=passwordController.text;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  //logo
                  /* ClipRRect(
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
                  ),
                  //Icon(Icons.lock, size: 80,),
                  SizedBox(height: 10,),
                  //welcome4
                  Text("Uygulama Girişi",
                    style: TextStyle(
                      color: Colors.grey.shade700, fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),

                  SizedBox(height: 20,),
                  //username textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade400)
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
                      controller: passwordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade400)
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Şifre",
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  //forgot password
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Şifremi Unuttum?',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),),
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                  //sign in button
                  GestureDetector(
                    //    onTap: signUserIn(),
                    child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(horizontal: 35),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                                _authService.login(email,password);
                              }
                            },
                            child: Text("Giriş Yap", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),),
                          ),
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
                        Text("İle Giriş Yap"), //yazı
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
                      GestureDetector(
                        onTap: () async
                        {
                          _authService.signWithGoogle();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[200]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset('assets/images/google.png',
                                  height: 55
                              ),
                            )
                        ),
                      ),
                      SizedBox(width: 10,),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[200]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset('assets/images/mail.png',
                              height: 55,
                              width:55
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Kayıtlı değil misiniz?"),
                      SizedBox(width: 4,),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                          },
                          child: Text(" Kayıt olun!",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold
                              )
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

