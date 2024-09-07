import 'package:exam_m13/shopping_card_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ShoppingCartApp());
}

class ShoppingCartApp extends StatelessWidget {
  const ShoppingCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const ShoppingCartScreen(),
    );
  }
}

