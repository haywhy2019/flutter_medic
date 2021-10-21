import 'package:flutter/material.dart';

class Categories {
  final String image;
  final String title;
  final num id;

  Categories({required this.image, required this.title, required this.id});
}

List categoriesList = [
  Categories(image: "assets/images/cough.png", title: "Cough", id: 1),
  Categories(image: "assets/images/headace.png", title: "Headache", id: 2),
  Categories(image: "assets/images/infant.png", title: "Infant", id: 3),
  Categories(image: "assets/images/supplement.png", title: "Supplement", id: 4)
];
