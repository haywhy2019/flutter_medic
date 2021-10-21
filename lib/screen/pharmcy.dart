// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:medic/Bloc/categories_bloc.dart';
import 'package:medic/Bloc/products_bloc.dart';
import 'package:medic/constants/const.dart';
import 'package:medic/icons/MedicIcons.dart';
import 'package:medic/screen/category.dart';
import 'package:medic/screen/search.dart';
import 'package:medic/widget/grid.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  bool loading = true;
  String search = "";
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryBloc = CategoryBloc();
    final suggestionBloc = SuggestionBloc();
    final mobileWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        bottomOpacity: 0,
        elevation: 0.0,
        backgroundColor: Color(0xffF2F2F2),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
              colors: const [Color(0xff7A08FA), Color(0xffAD3BFC)],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pharmacy",
                        style: appTitle,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.favorite_border_outlined,
                            color: whiteCol,
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            MyFlutterApp.appBarIcon,
                            color: whiteCol,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    controller: searchController,
                    onFieldSubmitted: (value) {
               Navigator.of(context).pushNamed(
                SearchScreen.routeName,
                arguments: value,
              );
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minHeight: 32,
                          minWidth: 32,
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 12.0, top: 0.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: "Search",
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color(0xffF2F2F2),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.place_outlined,
                        size: 15,
                      ),
                      Text("Delivery in"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Lagos, NG",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("CATEGORIES"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(CategoryScreen.routeName);
                      },
                      child: Text(
                        "VIEW ALL",
                        style: TextStyle(
                          color: primaryCol,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              StreamBuilder(
                  stream: categoryBloc.categoryStream,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: mobileWidth,
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryBloc.category.length,
                          itemBuilder: (ctx, idx) {
                            return SizedBox(
                                height: 100,
                                width: 150,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(CategoryScreen.routeName);
                                  },
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        categoryBloc.category[idx].image,
                                        fit: BoxFit.fitWidth,
                                      ),
                                      Positioned(
                                        left: 45,
                                        top: 40,
                                        child: Text(
                                          categoryBloc.category[idx].title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          }),
                    );
                  }),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "SUGGESTIONS",
                      style: TextStyle(color: Color(0xff363636)),
                    ),
                  ),
                ],
              ),
              StreamBuilder(
                stream: suggestionBloc.suggestionStream,
                builder: (context, snapshot) {
                  return Expanded(child: ProductGrid(suggestionBloc.sugestion));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, right: 20, bottom: 30),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        gradient: LinearGradient(
                          colors: const [Color(0xffFE806F), Color(0xffE5366A)],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Checkout",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.amber,
                            ),
                            height: 14,
                            width: 14,
                            child: Text(
                              "2",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
