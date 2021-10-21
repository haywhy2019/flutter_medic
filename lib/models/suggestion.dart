import 'package:flutter/material.dart';

class Suggestion {
  final String image;
  final String title;
  final num price;
  final num id;
  final String desc;

  Suggestion(
      {required this.image,
      required this.title,
      required this.id,
      required this.price,
      required this.desc});
}

List suggestionData = [
  Suggestion(
      image: "assets/images/pravetamol.png",
      title: "Paracetamol",
      desc: "Tablet * 500mg",
      id: 1,
      price: 350.00),
  Suggestion(
      image: "assets/images/dolli.png",
      title: "Dolliprane",
      id: 2,
      desc: "Capsule * 1000mg",
      price: 350.00),
  Suggestion(
      image: "assets/images/pracel2.png",
      title: "Paracetamol",
      desc: "Tablet * 500mg",
      id: 3,
      price: 350.00),
  Suggestion(
      image: "assets/images/pracel3.png",
      title: "Panadol",
      desc: "Tablet * 500mg",
      id: 4,
      price: 350.00),
  Suggestion(
      image: "assets/images/pracel4.png",
      title: "Ibuprofen",
      desc: "Tablet * 200mg",
      id: 5,
      price: 350.00),
  Suggestion(
      image: "assets/images/prace5.png",
      title: "Ibuprofen",
      desc: "Tablet * 500mg",
      id: 6,
      price: 350.00),
];
