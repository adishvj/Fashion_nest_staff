import 'package:flutter/material.dart';
import 'package:user/Screens/update_page.dart';

import '../main.dart';

class ProductManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Product Management'),
        backgroundColor: Colors.yellow[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Manage Your Products',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProduct(),
                    ));
                // Add product logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[900],
              ),
              child: Text(
                'Add Product',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Nike(),
                    ));
                // Update product logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[900],
              ),
              child: Text(
                'Update Product',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Delete product logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[900],
              ),
              child: Text(
                'Delete Product',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
