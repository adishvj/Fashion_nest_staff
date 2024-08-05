import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/product_model2.dart';

class ProductServices {
  Future<List<ProductModel>> getProducts() async {
    final Uri url = Uri.parse('$baseurl/api/product/viewProduct');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['data'] is List) {
          var productList = (data['data'] as List)
              .map(
                  (item) => ProductModel.fromJson(item as Map<String, dynamic>))
              .toList();
          print("helo");

          print(productList[0]);

          return productList;
        } else {
          throw Exception('The key "data" does not contain a list');
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<void> addProduct({
    required ProductModel product,
    required File imageFile,
  }) async {
    final Uri url = Uri.parse('$baseurl/api/product/addProduct');
    final request = http.MultipartRequest('POST', url)
      ..fields['title'] = product.title ?? ''
      ..fields['description'] = product.description ?? ''
      ..fields['review'] = product.review ?? ''
      ..fields['image'] = product.image ?? ''
      ..fields['seller'] = product.seller ?? ''
      ..fields['price'] = product.price.toString()
      ..fields['category'] = product.category ?? ''
      ..fields['rate'] = product.rate.toString()
      ..fields['quandity'] = product.quandity.toString()
      ..files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      );

    try {
      final response = await request.send();
      if (response.statusCode == 201) {
        print('Product added successfully');
      } else {
        throw Exception('Failed to add product');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<void> deleteProduct(String productId) async {
    final Uri url = Uri.parse('$baseurl/api/product/deleteProduct/$productId');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        print('Product deleted successfully');
      } else {
        throw Exception('Failed to delete product');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<void> updateProduct({
    required ProductModel product,
    File? imageFile,
  }) async {
    final Uri url =
        Uri.parse('$baseurl/api/product/updateProduct/${product.sId}');
    final request = http.MultipartRequest('PUT', url)
      ..fields['title'] = product.title ?? ''
      ..fields['description'] = product.description ?? ''
      ..fields['review'] = product.review ?? ''
      ..fields['image'] = product.image ?? ''
      ..fields['seller'] = product.seller ?? ''
      ..fields['price'] = product.price.toString()
      ..fields['category'] = product.category ?? ''
      ..fields['rate'] = product.rate.toString()
      ..fields['quandity'] = product.quandity.toString();

    if (imageFile != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      );
    }

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        print('Product updated successfully');
      } else {
        print('Failed to update product: ${response.statusCode}');
        print('Response: $responseBody');
        throw Exception('Failed to update product');
      }
    } catch (e) {
      print('An error occurred: $e');
      throw Exception('An error occurred: $e');
    }
  }
}
