import 'package:flutter/material.dart';
import '/models/theme.dart';
import '/providers/cart_provider.dart';
import '/providers/theme_provider.dart';
import '/screens/shopping_cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Cartprovider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider())
    ],
    child: Builder(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: context.watch<ThemeProvider>().themeMode,
        title: 'Provider example',
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darktheme,
        home: ShoppingScreen(),
      );
    }),
  ));
}
