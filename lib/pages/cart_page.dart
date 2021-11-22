import 'package:flutter/material.dart';
import 'package:flutter1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "Cart",
              style: TextStyle(color: Theme.of(context).accentColor),
            )),
        backgroundColor: Theme.of(context).cardColor,
        body: Column(
          children: [_CartList().p32(), Divider(), _CardTotal()],
        ));
  }
}

class _CardTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("\$${_cart.totalPrice}",
              style: TextStyle(
                  fontSize: 15, color: Theme.of(context).accentColor)),
          ElevatedButton(
              onPressed: () => {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Buying Not Supported yet")))
                  },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).buttonColor)),
              child: Text("Buy"))
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return _cart.items.isEmpty
        ? Center(child: Text("Nothing to show"))
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
                  leading:
                      Icon(Icons.done, color: Theme.of(context).accentColor),
                  trailing: IconButton(
                      onPressed: () {
                        _cart.remove(_cart.items[index]);
                      },
                      icon: Icon(Icons.remove_circle_outline,
                          color: Theme.of(context).accentColor)),
                  title: Text(_cart.items[index].name,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).accentColor)),
                ));
  }
}
