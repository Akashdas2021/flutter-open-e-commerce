import 'package:flutter/material.dart';
import 'package:freecommerce/models/models.dart';
import 'package:freecommerce/views/cart_view.dart';

import '../../main.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shopping_cart),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CartView(cart.products)));
      },
    );
  }
}
