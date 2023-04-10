// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                    image:AssetImage(
                      "assets/images/marlon-corona-1tMc27CFUbA-unsplash.jpg",),
                    colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.modulate,), 
 fit: BoxFit.cover
          )),
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("Welcome to EGY Furniture",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0) ,
                            fontFamily: "myfont")),

                    SizedBox(height: 200,),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/Login");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color.fromARGB(255 ,50, 95, 116)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18,color: Colors.white, fontFamily: "myfont"),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color.fromARGB(255 ,50, 95, 116)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 77, vertical: 13)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "Signup",
                        style: TextStyle(fontSize: 18, color: Colors.white,fontFamily: "myfont"),
                      ),
                    ),        
                  
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
