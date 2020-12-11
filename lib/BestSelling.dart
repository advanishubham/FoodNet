import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BestSelling extends StatefulWidget {
  @override
  _BestSellingState createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('data/bestSelling.json'),
        builder: (context, snapshot){
          var products = json.decode(snapshot.data.toString());
          return Container(
            margin: EdgeInsets.all(12),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              )
            ),
            child: StaggeredGridView.countBuilder(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              itemCount: products == null ? null : products.length,
              itemBuilder: (context, index) {
                return Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.grey,
                  child: Column(
                    children: <Widget>[
                      products[index]['price'].toString().isEmpty ? Padding(padding: EdgeInsets.all(1.0),)
                      :ListTile(
                        leading: Text("Trupti"),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: null,
                        ),
                      ),
                      Expanded(
                        child: ClipRect(
                          child: Image(
                            fit: products[index]['price'].toString().isEmpty ? BoxFit.fill 
                            :BoxFit.cover,
                            image: AssetImage(products[index]['image']),
                          ),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: products[index]['price'].toString().isEmpty ? <Widget>[
                            Text(products[index]['title']),
                          ]  
                          :<Widget>[
                            Text(products[index]['title']),
                            Text("Rs: ${products[index]['price']}"),
                            Text('Per Packet: ${products[index]['weight']} grams'),
                          ],
                        )
                      )
                    ],
                  ),
                );
              },
              staggeredTileBuilder: (index) {
                return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              }
            ),
          );
        },
    );
  }
}