import 'package:flutter/material.dart';
import 'package:medic/Bloc/products_bloc.dart';
import 'package:medic/constants/const.dart';
import 'package:basic_utils/basic_utils.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = "/search";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchParam = ModalRoute.of(context)!.settings.arguments as String;

    final search = StringUtils.capitalize(searchParam);

    final productBloc = SuggestionBloc();
    final mobileWidth = MediaQuery.of(context).size.width;
    final mobileHeight = MediaQuery.of(context).size.height;

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
                    .where((element) => element.title == search)
                    .toList();
                if (singleProduct.isEmpty) {
                  return Container(
                      child: Center(child: Text("Item not found")));
                } else {
                  return SizedBox(
                    width: mobileWidth,
                    height: mobileHeight,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 2 / 3),
                      itemCount: singleProduct.length,
                      itemBuilder: (ctx, idx) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                //background color of box
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5.0, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                )
                              ],
                            ),
                            height: 700,
                            child: Stack(
                              children: [
                                Container(
                                  height: 700,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(9)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.0),
                                              child: Text(
                                                singleProduct[idx].title,
                                                style: productTitleSty,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 1.0),
                                              child: Text(
                                                singleProduct[idx].desc,
                                                style: productDescSty,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                'N' +
                                                    singleProduct[idx]
                                                        .price
                                                        .toString(),
                                                style: productPriceSty,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffAD3BFC)),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: Colors.white),
                                                width: double.infinity,
                                                child: TextButton(
                                                    child: const Text(
                                                        'ADD TO CART',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff7A08FA),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Stack(
                                    children: [
                                      FittedBox(
                                        clipBehavior: Clip.hardEdge,
                                        child: Image.asset(
                                          singleProduct[idx].image,
                                          fit: BoxFit.cover,
                                          width: 300,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


// Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: GridTile(
//                             child: GestureDetector(
//                               onTap: () {},
//                               child: Card(
//                                 elevation: 3,
//                                 child: FittedBox(
//                                   child: Image.asset(
//                                     singleProduct[idx].image,
//                                     // height: 100,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             footer: Container(
//                               height: 50,
//                               padding: const EdgeInsets.only(bottom: 10),
//                               color: Colors.white,
                         
//                             ),
//                           ),
//                         ),
//                       );