// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import "./grid_item.dart";

class ProductGrid extends StatelessWidget {
  final product;
  const ProductGrid(this.product);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(8),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: product.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(product[index]);
        });
  }
}
