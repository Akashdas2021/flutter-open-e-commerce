import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopView extends StatefulWidget {
  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),),
      body: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(

            ),
          )
        ],
      ),
    );
  }
}
