import 'package:flutter/material.dart';
import 'package:foodnet/HorizontalScroll.dart';
import 'package:foodnet/TopPicks.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'BestSelling.dart';
import 'TopOffers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var imageList = [
    AssetImage('images/mumbai.png'),
  ];
  
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
            child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'What are you looking for?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    )
                  ),
                  suffixIcon: Icon(Icons.mic_none)
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('images/mumbai.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ]
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange
                ),
              )]
          ),
          ]
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        HorizontalScroll(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.stars),
            title: Text("Top Picks")
          ),
        ),
        Container(
          height: 320,
          child: TopPicks()
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(MdiIcons.percent),
            title: Text("Top Offers")
          ),
        ),
        TopOffers(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text("Best Selling")
          ),
        ),
        Container(
          height: 320,
          child: BestSelling(),
        )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.fileOutline),
            label: 'Orders'
          )
        ]
      ),
    );
  }
}