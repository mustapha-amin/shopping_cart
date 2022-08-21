import 'package:flutter/material.dart';
import '/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartItems = context.watch<Cartprovider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: cartItems.myCart.isNotEmpty
                ? ListView.builder(
                    itemCount: cartItems.myCart.length,
                    itemBuilder: (context, index) {
                      var item = cartItems.myCart[index];
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(item.item),
                          subtitle: Text(item.price.toString()),
                        ),
                      );
                    },
                  )
                : Center(child: Text("Your Cart is empty")),
          ),
          Center(
            child: Text(
              cartItems.totalPrice,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
