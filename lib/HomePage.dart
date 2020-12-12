import 'package:flutter/material.dart';
import 'package:foodnet/HorizontalScroll.dart';
import 'package:foodnet/Search.dart';
import 'package:foodnet/Slider.dart';
import 'package:foodnet/TopPicks.dart';
import 'BestSelling.dart';
import 'TopOffers.dart';
import 'package:badges/badges.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: SizedBox(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(Icons.more_vert),
                ),
                Icon(Icons.location_on_rounded)
              ],
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('images/logo.png'),
                fit: BoxFit.cover,
                height: 65.0,
              )
            ],
          ),
          actions: [
            Badge(
              position: BadgePosition.topEnd(top: 0, end: 3),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                '1',
                style: TextStyle(color: Colors.white),
              ),
              child:
                  IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
            )
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[SearchBar(), PhotoSlider(), HorizontalScroll(), TopPicks(), TopOffers(), BestSelling() ],
        ));
  }
}
