// ignore_for_file: prefer_const_constructors

//import 'dart:html';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/snackbar.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final EmailController = TextEditingController();

  final PasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool VisablePass = true;

  Register() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: EmailController.text,
        password: PasswordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }

  bool isPassword8Char = false;
  bool isPasswordHas1Number = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;

  onPasswordChanged(String password) {
    isPassword8Char = false;
    isPasswordHas1Number = false;
    hasUppercase = false;
    hasLowercase = false;
    hasSpecialCharacters = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        isPassword8Char = true;
      }

      if (password.contains(RegExp(r'[0-9]'))) {
        isPasswordHas1Number = true;
      }

      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUppercase = true;
      }

      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
      }

      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters = true;
      }
    });
  }
    void dispose() {
    // TODO: implement dispose
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/marlon-corona-1tMc27CFUbA-unsplash.jpg",
                    ),
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.8),
                      BlendMode.modulate,
                    ),
                    fit: BoxFit.cover)),
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                SizedBox(
                                  height: 35,
                                ),
                                Text("Sign up",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 57, 57, 57),
                                        fontFamily: "myfont")),
                                SizedBox(
                                  height: 200,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                const BoxShadow(
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            width: 266,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              validator: (value) {
                                return value != null &&
                                        !EmailValidator.validate(value)
                                    ? "Enter a valid email"
                                    : null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: EmailController,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.blue[800],
                                  ),
                                  labelText: "Your Email:",
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 23,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                const BoxShadow(
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            width: 266,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              onChanged: (value) {
                                onPasswordChanged(value);
                              },
                              validator: (value) {},
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: PasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  suffix: IconButton(
                                    iconSize: 20,
                                    padding: EdgeInsets.only(top: 20),
                                    onPressed: () {
                                      setState(() {
                                        VisablePass = !VisablePass;
                                      });
                                    },
                                    icon: VisablePass
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off),
                                    color: Colors.blue[900],
                                  ),
                                  labelText: "Password :",
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 125,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await Register();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              } else {
                                showSnackBar(context, 'Try Again Later');
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 50, 95, 116)),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 106, vertical: 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27))),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text("Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  child: Text(" Sign in",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)))
                            ],
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          SizedBox(
                            width: 299,
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Expanded(
                                    child: Divider(
                                  thickness: 0.6,
                                  color: Colors.white,
                                )),
                                Text(
                                  "OR",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Expanded(
                                    child: Divider(
                                  thickness: 0.6,
                                  color: Colors.white,
                                )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 27),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    child: Image.asset(
                                      "assets/images/apple_pic.png",
                                      height: 27,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 22,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    child: Image.asset(
                                      "assets/images/google_pic.png",
                                      height: 27,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 22,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    child: Image.asset(
                                      "assets/images/facebook_pic.png",
                                      height: 27,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
