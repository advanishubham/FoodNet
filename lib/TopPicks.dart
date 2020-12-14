import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            padding: EdgeInsets.all(3.0),
            child: ListTile(
                leading: Icon(Icons.stars),
                title: Align(
                  alignment: Alignment(-1.2, 0.0),
                  child: Text(
                    "Top Picks",
                  ),
                )),
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
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        semanticContainer: true,
                        clipBehavior: Clip.antiAlias,
                        shadowColor: Colors.grey[600],
                        elevation: 4.0,
                        child: Column(
                          children: <Widget>[
                            Stack(children: [
                              ListTile(
                                leading: Text("Trupti",
                                    style: GoogleFonts.elsieSwashCaps(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black87)),
                              ),
                              Positioned(
                                top: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0)),
                                    color: Colors.grey[50],
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: null,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ]),
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
                            Align(
                              alignment: Alignment(-0.5, 0.0),
                              child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${products[index]['title']}',
                                        style:
                                            TextStyle(color: Colors.grey[600]),
                                      ),
                                      Text(
                                        "₹ ${products[index]['price']}",
                                        style:
                                            TextStyle(color: Colors.grey[600]),
                                      ),
                                      Text(
                                        'per packet [${products[index]['weight']}]',
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  )),
                            )
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
