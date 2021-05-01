import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freecommerce/models/models.dart';
import 'package:freecommerce/services/order_service.dart';
import 'package:freecommerce/views/PriceDetails.dart';

import 'product_view.dart';

class CheckoutView extends StatelessWidget {
  final List<Product> products;

  CheckoutView({@required this.products});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Checkout"),
        ),
        body: ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                Product product = products[index];
                return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.name),
                  subtitle: Text("${product.price}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductView(product)),
                    );
                  },
                );
              },
            ),
            PriceDetails(),
            ElevatedButton(
              child: Text("Place order"),
              onPressed: () async {
                /// get user profile
                var data = await FirebaseFirestore.instance
                    .doc('profiles/${FirebaseAuth.instance.currentUser.uid}')
                    .get();
                Profile profile = Profile.fromMap(data.data());

                /// create order object
                Order order = Order(
                    products: products,
                    buyer: profile,
                    deliveryAddress: Adress(city: "Agartala"));
                await OrderService().saveOrder(order);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Your order has been placed."),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}