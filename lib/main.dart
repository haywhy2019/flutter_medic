import 'package:flutter/material.dart';
import 'package:medic/constants/const.dart';
import 'package:medic/icons/medicIcons.dart';
import 'package:medic/screen/Home.dart';
import 'package:medic/screen/category.dart';
import 'package:medic/screen/community.dart';
import 'package:medic/screen/doctor.dart';
import 'package:medic/screen/pharmcy.dart';
import 'package:medic/screen/product_detail.dart';
import 'package:medic/screen/profile.dart';
import 'package:medic/screen/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Proxima",
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      home: const MyStatefulWidget(),
      routes: {
         CategoryScreen.routeName: (ctx) => CategoryScreen(),
         DetailScreen.routeName: (ctx) => const DetailScreen(),
          SearchScreen.routeName: (ctx) => const SearchScreen(),

      },
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 2;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DoctorScreen(),
    PharmacyScreen(),
    CommunityScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              MyFlutterApp.home,
              color: bottomMenuIconCol,
            ),
            activeIcon: Icon(
              MyFlutterApp.home,
              color: primaryCol,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyFlutterApp.doctor,
              color: bottomMenuIconCol,
            ),
            activeIcon: Icon(
              MyFlutterApp.doctor,
              color: primaryCol,
            ),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyFlutterApp.pharmacy,
              color: bottomMenuIconCol,
            ),
            activeIcon: Icon(
              MyFlutterApp.pharmacy,
              color: primaryCol,
            ),
            label: 'Pharmacy',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyFlutterApp.comunity1,
              color: bottomMenuIconCol,
            ),
            activeIcon: Icon(
              MyFlutterApp.comunity1,
              color: primaryCol,
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyFlutterApp.profile,
              color: bottomMenuIconCol,
            ),
            activeIcon: Icon(
              MyFlutterApp.profile,
              color: primaryCol,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryCol,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
