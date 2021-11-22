import 'package:flutter/material.dart';
import 'package:flutter1/models/cart.dart';
import 'package:flutter1/models/itemModel.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.item);
    return ElevatedButton(
        onPressed: () {
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          if (isInCart) {
          }
          // _cart.remove(widget.item);
          else
            _cart.add(widget.item);
          isInCart = !isInCart;
          setState(() => {});
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).buttonColor,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            )),
        child: isInCart
            ? Icon(Icons.done)
            : Text("\$${widget.item.price.toString()}",
                style: TextStyle(fontSize: 12)));
  }
}
