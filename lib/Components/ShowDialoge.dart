import 'package:flutter/material.dart';

class MyDialog {
  static void show(BuildContext context, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Product Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${data['name']}'),
              Text('Brand: ${data['brand']}'),
              Text('Sell Price: ${data['price_sell']}'),
              Text('Buy Price: ${data['price_buy']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  // Mock data, replace this with your actual data
  final Map<String, dynamic> data = {
    'name': 'Product Name',
    'brand': 'Product Brand',
    'price_sell': '100',
    'price_buy': '80',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            MyDialog.show(context, data);
          },
          child: Text('Show Product Details'),
        ),
      ),
    );
  }
}
