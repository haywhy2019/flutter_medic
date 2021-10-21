// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:medic/Bloc/products_bloc.dart';
import 'package:medic/constants/const.dart';

class DetailScreen extends StatefulWidget {
  static String routeName = "/product-details";

  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final productBloc = SuggestionBloc();
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments;
    final mobileWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        bottomOpacity: 0,
        elevation: 0.0,
        backgroundColor: const Color(0xffF2F2F2),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
              colors: [Color(0xff7A08FA), Color(0xffAD3BFC)],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 30, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 40,
                            ),
                            Text(
                              "Pharmacy",
                              style: appTitle,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: whiteCol,
                            size: 30,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: productBloc.suggestionStream,
              builder: (context, snapshot) {
                final singleProduct = productBloc.sugestion
                    .firstWhere((element) => element.id == productId);

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(singleProduct.image),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              singleProduct.title,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            singleProduct.desc,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/maker logo.png"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "SOLD BY",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff8EA5BC)),
                                      ),
                                      Text(
                                        "Emzor Pharmaceuticals",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff13447A)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: const Color(0xff9F5DE2).withOpacity(0.3),
                              child: const Icon(
                                Icons.favorite_border_outlined,
                                color: Color(0xff9F5DE2),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Card(
                                  elevation: 1,
                                  child: SizedBox(
                                    width: 70,
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (counter > 0) {
                                              setState(() {
                                                --counter;
                                              });
                                            }
                                          },
                                          child: const Icon(
                                            Icons.remove,
                                            size: 10,
                                          ),
                                        ),
                                        Text(
                                          counter.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              ++counter;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            size: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Pack(s)",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "N",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  singleProduct.price.toString() + '0',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, top: 15, bottom: 15),
                        child: Row(
                          children: const [
                            Text(
                              "PRODUCT DETAILS",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff8EA5BC),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ProductInfoWidget(
                        image: "assets/images/prod1.png",
                        size: "PACK SIZE",
                        sizeNo: "8 x 12 tablets (96)",
                        image2: "assets/images/prod2.png",
                        id: "Product",
                        idNo: "PRO37463",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProductInfoWidget(
                        image: "assets/images/prod3.png",
                        size: "CONSTITUENTS",
                        sizeNo: "Paracetamol",
                        image2: "assets/images/prod4.png",
                        id: "DISPENSED IN",
                        idNo: "Packs       ",
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text(
                          "1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Similar Products",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ),
                          SizedBox(
                            width: mobileWidth,
                            height: 150,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (ctx, idx) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: GridTile(
                                          child: GestureDetector(
                                            onTap: () {
                                              // Navigator.of(context).pushNamed(
                                              //   DetailScreen.routeName,
                                              //   arguments: product.id,
                                              // );
                                            },
                                            child: Image.asset(
                                              productBloc.sugestion[idx].image,
                                              height: 100,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          footer: Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 3.0),
                                                    child: Text(
                                                      productBloc
                                                          .sugestion[idx].title,
                                                      style: productTitleSty,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 1.0),
                                                    child: Text(
                                                      productBloc
                                                          .sugestion[idx].desc,
                                                      style: productDescSty,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0),
                                                    child: Text(
                                                      'N' +
                                                          productBloc
                                                              .sugestion[idx]
                                                              .price
                                                              .toString(),
                                                      style: productPriceSty,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 20),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff7A08FA),
                                    Color(0xffAD3BFC)
                                  ],
                                ),
                              ),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                  ),
                                  TextButton(
                                    child: const Text('Add to Cart',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 30),
                                                    child: Text(
                                                      "Emzor Pracetamol has been successfully added to your cart",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xff7A08FA),
                                                              Color(0xffAD3BFC)
                                                            ],
                                                          ),
                                                        ),
                                                        width: double.infinity,
                                                        child: TextButton(
                                                            child: const Text(
                                                                'View Cart',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            }),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: const Color(
                                                                    0xffAD3BFC)),
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                            5)),
                                                            color:
                                                                Colors.white),
                                                        width: double.infinity,
                                                        child: TextButton(
                                                            child: const Text(
                                                                'CONTINUE SHOPPING',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff7A08FA),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            }),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductInfoWidget extends StatelessWidget {
  String image;
  String size;
  String sizeNo;
  String image2;
  String id;
  String idNo;

  ProductInfoWidget(
      {required this.image,
      required this.size,
      required this.sizeNo,
      required this.image2,
      required this.id,
      required this.idNo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(image),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    size,
                    style:
                        const TextStyle(fontSize: 8, color: Color(0xff8EA5BC)),
                  ),
                  Text(
                    sizeNo,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff13447A)),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(image2),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      id,
                      style: const TextStyle(
                        fontSize: 8,
                        color: Color(0xff8EA5BC),
                      ),
                    ),
                    Text(
                      idNo,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff13447A)),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
