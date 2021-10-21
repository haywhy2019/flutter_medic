// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:medic/constants/const.dart';
import 'package:medic/screen/product_detail.dart';

class ProductItem extends StatelessWidget {
  final product;
  const ProductItem(this.product);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                DetailScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.asset(
              product.image,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          footer: Container(
            padding: const EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      product.title,
                      style: productTitleSty,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Text(
                      product.desc,
                      style: productDescSty,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'N' + product.price.toString(),
                      style: productPriceSty,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
