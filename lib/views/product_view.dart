import 'package:flutter/material.dart';
import 'package:freecommerce/main.dart';
import 'package:freecommerce/models/models.dart';
import 'package:freecommerce/views/checkout_view.dart';
import 'package:freecommerce/views/product_add_edit_form.dart';
import 'package:freecommerce/views/wigets/cart_icon.dart';


class ProductView extends StatefulWidget {
  final Product product;

  ProductView(this.product);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${widget.product.name}"),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductAddEditView(widget.product)),
                );
                setState(() {});
              },
            ),
            CartIcon()
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.network(
                widget.product.imageUrl,
                height: 300.0,
              ),
              Text(
                widget.product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.product.inStock ? 'In-Stock' : 'Out of stock',
                style: TextStyle(
                    color: widget.product.inStock ? Colors.green : Colors.red),
              ),
              Text(widget.product.description),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        cart.products.add(widget.product);

                        /// show snack for confirmation
                        final snak = SnackBar(
                          content: Text(
                              "${widget.product.name} is added to your cart"),
                        );
                        Scaffold.of(context).showSnackBar(snak);
                      },
                      child: Text('Add to Cart')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutView(
                                  products: [widget.product],
                                )));
                      },
                      child: Text('Buy')),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}