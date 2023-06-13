import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Wishlist"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text("No item added to wishlist"),
      ),
    );
  }
}
