import 'package:flutter/material.dart';
import '/providers/cart_provider.dart';
import '/providers/theme_provider.dart';
import '/screens/mycart.dart';
import 'package:provider/provider.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeProvider>().isDarkMode;
    var items = context.watch<Cartprovider>().items;
    var cartLength = context.watch<Cartprovider>().myCart.length;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 40,
                child: Text("M"),
              ),
            ),
            SwitchListTile(
              title: const Text("Dark mode"),
              value: isDark,
              onChanged: (bool newVal) {
                context.read<ThemeProvider>().toggletheme(newVal);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: const Text("Shoppify"),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MyCart();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                bottom: 9,
                right: 4,
                child: Text(cartLength.toString()),
              )
            ],
          )
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return Card(
            elevation: 3,
            child: ListTile(
              title: Text(item.item),
              subtitle: Text("\$${item.price}"),
              trailing: TextButton(
                  onPressed: () {
                    item.selected = !item.selected;
                    if (item.selected) {
                      context.read<Cartprovider>().addtoCart(index);
                    } else {
                      context.read<Cartprovider>().removeFromCart(index);
                    }
                  },
                  child: item.selected
                      ? const Icon(Icons.check)
                      : const Text("Buy")),
            ),
          );
        },
      ),
    );
  }
}
