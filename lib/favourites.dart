import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/PopularProdcut.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Kanbti extends StatefulWidget {
  const Kanbti({super.key});

  @override
  State<Kanbti> createState() => _KanbtiState();
}

class _KanbtiState extends State<Kanbti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        ),
        elevation: 0.9,
        backgroundColor: Color.fromARGB(255, 100, 120, 129),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 400,
          color: Color.fromARGB(255, 100, 120, 129),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 220),
                child: Text(
                  'You do not have favourites',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "abady",
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Container(
                width: 220,
                child: Text(
                  'take a look at a selection we have create to you',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                margin: EdgeInsets.fromLTRB(0, 12, 0, 110),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(15, 0, 0, 12),
                child: Text(
                  'You might be interested in',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "abady",
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PopularProdcut(imagepath: "assets/images/img5.jpg"),
                    PopularProdcut(imagepath: "assets/images/img6.jpg"),
                   PopularProdcut(imagepath: "assets/images/img7.jpg")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
