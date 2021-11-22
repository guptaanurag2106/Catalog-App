import 'package:flutter/material.dart';
import 'package:flutter1/models/itemModel.dart';
import 'package:flutter1/widgets/add_to_cart.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: null,
          leading: Hero(
              tag: Key(item.id.toString()), child: Image.network(item.image)),
          title: Text(item.name,
              style: TextStyle(color: Theme.of(context).accentColor)),
          subtitle: Text(item.desc,
              style: TextStyle(
                  fontSize: 12, color: Theme.of(context).accentColor)),
          trailing: Container(
            child: Column(
              children: [
                // Text("\$${item.price.toString()}",
                //     textScaleFactor: 1.2,
                //     style: TextStyle(
                //         color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                AddToCart(item: item)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
