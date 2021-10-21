// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

AppBar appBarWidget(List<Widget> heading, List<Widget> belowHeading) {
  return AppBar(
    bottomOpacity: 0,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: heading,
          ),
        ),
      ],
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [Color(0xff7A08FA), Color(0xffAD3BFC)],
        ),
      ),
      child: ListTile(
        leading: Icon(Icons.search),
        // title: Text(),
      ),
    ),
  );
}
