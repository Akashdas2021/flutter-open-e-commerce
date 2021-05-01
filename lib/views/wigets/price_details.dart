import 'package:flutter/material.dart';

class PriceDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.yellow,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Price Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('Price(1 item)'), Text('₹200')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Discount'),
                  Text('10%', style: TextStyle(color: Colors.green))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('Delivery Charges'), Text('₹50')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('₹250',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              Text('You are saving ₹20',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green)),

            ],
          ),
        ),
      ),
    );
  }
}