// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/CategoriesModel.dart';
import 'package:flutter_application_1/Shared/PopularProdcut.dart';
import 'package:flutter_application_1/forall.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/favourites.dart';
import 'package:flutter_application_1/Profile.dart';
import 'package:flutter_application_1/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 100, 120, 129),
      ),
      drawer: Drawer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Galaxy.jpg"),
                          fit: BoxFit.cover),
                    ),
                    accountName: Text("Robert denarow",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        )),
                    accountEmail: Text("Robert@yahoo.com"),
                    currentAccountPictureSize: Size.square(85),
                    currentAccountPicture: CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            AssetImage("assets/images/Person.jpg")),
                  ),
                  ListTile(
                    leading: Icon(Icons.category, color: Colors.black),
                    title: const Text('Categories',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                      Navigator.pushNamed(context, "/Categories");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.call, color: Colors.black),
                    title: const Text('Contact us',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                      Navigator.pushNamed(context, "/contactUs");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.black),
                    title: const Text(
                      'Blog',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                      Navigator.pushNamed(context, "/Blog");
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.format_quote_outlined, color: Colors.black),
                    title: const Text('About us',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                      Navigator.pushNamed(context, "/Aboutus");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.black),
                    title: const Text('Logout',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () async{
                      // Update the state of the app.
                      // ...
                      await FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            ]),
      ),
      backgroundColor: Color.fromARGB(255, 100, 120, 129),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        // ignore: prefer_const_literals_to_create_immutables
        child: SingleChildScrollView(
          child: Column(

              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "What are you looking for ?",
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "myfont",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 43,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: TextField(
                        decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "search",
                      border: InputBorder.none,
                    )),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('Dining Room',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontFamily: "myfont",
                                fontWeight: FontWeight.bold,
                              )),
                          IconButton(
                            icon: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                    "assets/images/DiningRoom.jpg")),
                            iconSize: 230,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => dining()));
                            },
                          )
                        ],
                      ),
                      Column(children: [
                          Text('Living Room',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontFamily: "myfont",
                                fontWeight: FontWeight.bold,
                              )),
                          IconButton(
                            icon: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                    "assets/images/LivingRoom.jpg")),
                            iconSize: 230,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => living()));
                            },
                          )
                      ],)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Popular products",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: "myfont",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: IconButton(
                          icon: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('assets/images/Chair.jpg')),
                          iconSize: 200,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => chair()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: IconButton(
                          icon: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('assets/images/Bedroom.jpg')),
                          iconSize: 200,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => beds()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: IconButton(
                          icon: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('assets/images/Cupboard.jpg')),
                          iconSize: 200,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => drawer()));
                          },
                        ),
                      )
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
