// ignore: file_names
import 'package:flutter/material.dart';

List Beds = [
  'assets/images/Beds2.jpg',
  'assets/images/bed1.jpg',
  'assets/images/Bedroom.jpg'
];
List Living = ['assets/images/LivingRoom.jpg'];
List Mirrors = [
  'assets/images/mirrors.jpg',
];
List Chairs = [
  'assets/images/chair.jpeg',
  'assets/images/Chair.jpg',
  'assets/Chair.jpg'
];
List DiningRooms = ['assets/images/DiningRoom.jpg'];
List Drawers = [
  'assets/images/Chest of drawers.jpg',
  'assets/images/drawer1.jpg'
];
List Sofas = ['assets/images/Sofa.glb', 'assets/images/sofas.jpg'];

class CartItems extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  final List CartList = [];
  add( product) {
    CartList.add(product);
    notifyListeners();
  }

  remove( product) {
    CartList.remove(product);
    notifyListeners();
  }
}

class Items {
  late String path;
  Items({required this.path, });
}
