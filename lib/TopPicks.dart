import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TopPicks extends StatefulWidget {
  @override
  _TopPicksState createState() => _TopPicksState();
}

class _TopPicksState extends State<TopPicks> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Column(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child:
                ListTile(leading: Icon(Icons.stars), title: Text("Top Picks")),
          ),
          FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('data/products.json'),
              builder: (context, snapshot) {
                var products = json.decode(snapshot.data.toString());
                return StaggeredGridView.countBuilder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
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
                                child: Container(
                              margin: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(products[index]['image']),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Title: ${products[index]['title']}'),
                                    Text("Rs: "),
                                    Text('Per Packet: grams'),
                                  ],
                                ))
                          ],
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return new StaggeredTile.count(
                          1, index.isEven ? 1.2 : 1.8);
                    });
              }),
        ]);
      }, childCount: 1),
    );
  }
}
