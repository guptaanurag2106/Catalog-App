import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/models/itemModel.dart';
import 'package:flutter1/pages/home_page_detail.dart';
import 'package:flutter1/utils/routes.dart';
import 'package:flutter1/widgets/drawer.dart';
import 'package:flutter1/widgets/item_widget.dart';

void main = () => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogjson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogjson);
    var products = decodedData["products"];
    CatalogModel.items =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          // see main.dart appBarTheme
          // backgroundColor: Colors.white,
          // elevation: 0,
          // iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Catalog App',
            style:
                TextStyle(fontSize: 30, color: Theme.of(context).accentColor),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: Theme.of(context).buttonColor,
          child: Icon(CupertinoIcons.cart, color: Colors.white)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CatalogModel.items != null && CatalogModel.items.isNotEmpty
            ? ListView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeDetailsPage(
                                  catalog: CatalogModel.items[index]))),
                      //not pushNames as we have to pass data along with route
                      child: ItemWidget(
                        item: CatalogModel.items[index],
                      ),
                    ))
            // ? GridView.builder(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisSpacing: 16,
            //         crossAxisSpacing: 16),
            //     itemBuilder: (context, index) {
            //       final item = CatalogModel.items[index];
            //       return Card(
            //         clipBehavior: Clip.antiAlias,
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10)),
            //         child: GridTile(
            //           header: Container(
            //             child: Text(item.name,
            //                 style: TextStyle(color: Colors.white)),
            //             padding: EdgeInsets.all(10),
            //             decoration: BoxDecoration(
            //               color: Colors.deepPurple,
            //             ),
            //           ),
            //           child: Image.network(item.image),
            //           footer: Container(
            //             child: Text(item.price.toString(),
            //                 style: TextStyle(color: Colors.white)),
            //             padding: EdgeInsets.all(10),
            //             decoration: BoxDecoration(
            //               color: Colors.black,
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //     itemCount: CatalogModel.items.length,
            //   )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
