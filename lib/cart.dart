// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Products.dart';
import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int item = 0;
  int item2 = 0;
  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<CartItems>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 100, 120, 129),
      appBar: AppBar(
        elevation: 25,
        backgroundColor: Color.fromARGB(255, 100, 120, 129),
        // ignore: prefer_const_constructors
        title: Text(
          "Your Cart",
          softWrap: true,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "myfont",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: classInstancee.CartList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.white,
              child: Row(
                children: [
                  Image.asset(
                    "${classInstancee.CartList[index]}",
                    width: 120,
                    height: double.infinity,
                  ),
                  SizedBox(
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
                          child: Text("Product name : Bed",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                          child: Text("EGP before/after :",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                          child: Text("Color:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 110,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (item == 0) {
                                      item = 0;
                                    } else {
                                      item--;
                                    }
                                  });
                                },
                                icon: Icon(Icons.exposure_minus_1)),
                            Text("$item",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                    fontSize: 20)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    item++;
                                  });
                                },
                                icon: Icon(Icons.exposure_plus_1)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
      )]));
          }),
    );
  }
}
