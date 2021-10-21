// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:medic/constants/const.dart';
import 'package:medic/Bloc/categories_bloc.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = "/category-screen";
  final categoryBloc = CategoryBloc();

  @override
  Widget build(BuildContext context) {
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
                                "Categories",
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
        body: StreamBuilder<Object>(
            stream: categoryBloc.categoryStream,
            builder: (context, snapshot) {
              return MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Image.asset(
                            categoryBloc.category[index].image,
                            fit: BoxFit.contain,
                          ),
                          Positioned(
                            left: 60,
                            top: 50,
                            child: Text(
                              categoryBloc.category[index].title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      );
                    }),
              );
            }));
  }
}
