import 'package:flutter/material.dart';

class HorizontalScroll extends StatefulWidget {
  @override
  _HorizontalScrollState createState() => _HorizontalScrollState();
}

class _HorizontalScrollState extends State<HorizontalScroll> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(top: 13),
          decoration: BoxDecoration(
              color: Colors.white, border: Border.all(color: Colors.grey[200])),
          height: 80.0,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Product(productImage: 'images/snacks.png', productName: 'Snacks'),
              Product(
                productImage: 'images/farsan.png',
                productName: 'Farsan',
              ),
              Product(
                productImage: 'images/sweets.png',
                productName: 'Sweets',
              ),
              Product(
                productImage: 'images/dry_fruits.png',
                productName: 'Dry Fruits',
              ),
              Product(
                productImage: 'images/chocolate.png',
                productName: 'Chocolates',
              )
            ],
          ),
        );
      }, childCount: 1),
    );
  }
}

class Product extends StatelessWidget {
  final String productImage;
  final String productName;

  Product({this.productImage, this.productName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
          child: Container(
        width: 100,
        child: ListTile(
            title: Image(
              image: AssetImage(productImage),
              width: 100,
              height: 50,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                productName,
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
            )),
      )),
    );
  }
}
