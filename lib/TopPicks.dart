import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TopPicks extends StatefulWidget {
  @override
  _TopPicksState createState() => _TopPicksState();
}

class _TopPicksState extends State<TopPicks> {
  List data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('data/products.json'),
        builder: (context, snapshot){
          var products = json.decode(snapshot.data.toString());
          return StaggeredGridView.countBuilder(
            physics: ScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              itemCount: products == null ? null : products.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.grey,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Text("Trupti"),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: null,
                        ),
                      ),
                      Expanded(
                        child: ClipRect(
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(products[index]['image']),
                          ),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
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
          );
        },
    );
  }
}