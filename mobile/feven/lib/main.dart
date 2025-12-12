import 'package:feven/pages/home.dart';
import 'package:flutter/material.dart';
import 'pages/details.dart';
import 'pages/add_product.dart';
import 'pages/search_product.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          '/home':(context) => const HomePage(),
          '/details': (context) => const Details(),
          '/add': (context) => const AddProduct(),
          '/search':(context) => const SearchProduct(),

          },
);

  }
}
