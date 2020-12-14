import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
        height: 200,
        width: 180,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(productImage)),
            borderRadius: BorderRadius.circular(12.0)),
      )),
    );
  }
}

class TopOffers extends StatefulWidget {
  @override
  _TopOffersState createState() => _TopOffersState();
}

class _TopOffersState extends State<TopOffers> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Column(children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
              leading: Icon(MdiIcons.percent),
              title: Align(
                  alignment: Alignment(-1.2, 0.0), child: Text("Top Offers"))),
        ),
        Container(
          height: 140.0,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Product(
                productImage: 'images/top_offers/offer1.png',
              ),
              Product(
                productImage: 'images/top_offers/offer2.png',
              ),
              Product(
                productImage: 'images/top_offers/offer3.png',
              ),
              Product(
                productImage: 'images/top_offers/offer4.png',
              ),
            ],
          ),
        ),
      ]);
    }, childCount: 1));
  }
}
