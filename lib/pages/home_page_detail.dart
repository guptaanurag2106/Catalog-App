import 'package:flutter/material.dart';
import 'package:flutter1/models/itemModel.dart';
import 'package:flutter1/widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Theme.of(context).canvasColor,
        bottomNavigationBar: Container(
          color: Theme.of(context).canvasColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            children: [
              Text("\$${catalog.price.toString()}",
                  style: TextStyle(fontSize: 25, color: Colors.red[800])),
              AddToCart(item: catalog)
            ],
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),
              ).h32(context),
              Expanded(
                  child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Theme.of(context).cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      Text(catalog.name,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 32)),
                      Text(catalog.desc,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16)),
                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec odio rhoncus, pulvinar ",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 16))
                          .p16(),
                    ],
                  ).py64(),
                ),
              ))
            ],
          ),
        ));
  }
}
