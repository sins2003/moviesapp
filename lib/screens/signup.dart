import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../database/firebaseauth.dart';
import 'login.dart';

class signuppage extends StatefulWidget{
  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  var formkey = GlobalKey<FormState>();
  bool showpass = true;
  bool showconpass = true;
  var semail = TextEditingController();
  var spass = TextEditingController();
  var sconpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.orange.shade900,
                    Colors.orange.shade800,
                    Colors.orange.shade400
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: FadeInUp(duration: Duration(milliseconds: 1000), child: Text("Signup", style: TextStyle(color: Colors.white, fontSize: 40),))),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        FadeInUp(duration: Duration(milliseconds: 1400), child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: TextFormField(
                                  controller: semail,
                                  validator: (email) {
                                    if (email!.isEmpty ||
                                        !email.contains(".") ||
                                        !email.contains("@")) {
                                      return "Please enter valid email";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          'assets/images/email.png',
                                          width: 10,
                                          height: 10,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: TextFormField(
                                  controller: spass,
                                  validator: (password) {
                                    if (password!.isEmpty || password.length < 6) {
                                      return "Please enter valid password";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: showpass,
                                  obscuringCharacter: "*",
                                  decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          'assets/images/password.png',
                                          width: 10,
                                          height: 10,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: TextFormField(
                                  validator: (conpass) {
                                    if (conpass == spass.text) {
                                      if (conpass!.isEmpty || conpass.length < 6) {
                                        return "Please enter valid password";
                                      } else {
                                        return null;
                                      }
                                    } else {
                                      return "Password not match";
                                    }
                                  },
                                  controller: sconpass,
                                  obscureText: showconpass,
                                  obscuringCharacter: "*",
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/images/password.png',
                                        width: 10,
                                        height: 10,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(height: 40,),
                        // FadeInUp(duration: Duration(milliseconds: 1500), child: Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 40,),
                        FadeInUp(duration: Duration(milliseconds: 1600), child: MaterialButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              firebaseHelper()
                                  .SignUp(
                                  mail: semail.text!,
                                  password: spass.text!)
                                  .then((value) {
                                if (value == null) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => loginpage(),
                                      ));
                                } else {
                                  Get.snackbar("Error", value);
                                }
                              });
                            } else {}
                          },
                          height: 50,
                          // margin: EdgeInsets.symmetric(horizontal: 50),
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),

                          ),
                          // decoration: BoxDecoration(
                          // ),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        )),
                        FadeInUp(
                            duration: Duration(milliseconds: 1500),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                      builder: (context) => loginpage(),));
                              },
                              child: Text("Already Have account? Login",
                                style: TextStyle(color: Colors.grey),),
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}