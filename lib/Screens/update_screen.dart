import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/product_model2.dart';
import '../view_model/product_view_model.dart';
import '../widgets/cutom_button.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({
    Key? key,
    required this.itemname,
    required this.price,
    required this.image,
    required this.SId,
    required this.description,
    required this.quandity,
    required this.review,
    required this.seller,
    required this.category,
    required this.rate,
  }) : super(key: key);
  final String SId;
  final String itemname;
  final int price;
  final String image;
  final String description;
  final int quandity;
  final String review;
  final String seller;
  final String category;
  final double rate;

  @override
  _UpdateProductState createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  XFile? pickedImage;
  final TextEditingController itemnameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quandityController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();
  final TextEditingController sellerController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    itemnameController.text = widget.itemname;
    descriptionController.text = widget.description;
    priceController.text = widget.price.toString();
    quandityController.text = widget.quandity.toString();
    reviewController.text = widget.review;
    sellerController.text = widget.seller;
    categoryController.text = widget.category;
    rateController.text = widget.rate.toString();
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(35.0),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Add photo",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Airbnb",
                              fontSize: 20)),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.yellow[900],
                                title: Text("Remove Photo"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel",
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        pickedImage = null;
                                      });
                                    },
                                    child: Text("Remove",
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 65,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.yellow[900],
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    final imagePicker = ImagePicker();
                                    final pickedImage = await imagePicker
                                        .pickImage(source: ImageSource.camera);
                                    if (pickedImage != null) {
                                      setState(() {
                                        this.pickedImage = pickedImage;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "Camera",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.yellow[900],
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    final imagePicker = ImagePicker();
                                    final pickedImage = await imagePicker
                                        .pickImage(source: ImageSource.gallery);
                                    if (pickedImage != null) {
                                      setState(() {
                                        this.pickedImage = pickedImage;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.photo,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "Gallery",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow[900])),
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow[900],
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 15,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 120,
              child: Text(
                "Update Product",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Airbnb",
                  color: Colors.white70,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              top: 90,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: pickedImage != null
                                  ? FileImage(File(pickedImage!.path))
                                  : NetworkImage(widget.image) as ImageProvider,
                              child: pickedImage == null
                                  ? Icon(
                                      Icons.add_a_photo_outlined,
                                      color: Colors.black,
                                      size: 50,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        controller: itemnameController,
                        decoration: InputDecoration(
                          labelText: "Enter the name of the item",
                          hintText: widget.itemname,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter the price",
                          hintText: widget.price.toString(),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          labelText: "Enter the description",
                          hintText: widget.description,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: quandityController,
                        decoration: InputDecoration(
                          labelText: "Enter the quantity",
                          hintText: widget.quandity.toString(),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: reviewController,
                        decoration: InputDecoration(
                          labelText: "Enter the review",
                          hintText: widget.review,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: sellerController,
                        decoration: InputDecoration(
                          labelText: "Enter the seller name",
                          hintText: widget.seller,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: categoryController,
                        decoration: InputDecoration(
                          labelText: "Enter the category name",
                          hintText: widget.category,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: rateController,
                        decoration: InputDecoration(
                          labelText: "Enter the rate name",
                          hintText: widget.rate.toString(),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      Consumer<ProductViewModel>(
                        builder: (context, productViewModel, _) {
                          return Column(
                            children: [
                              CustomButton(
                                onPressed: () {
                                  if (pickedImage != null) {
                                    ProductModel updatedProduct = ProductModel(
                                        sId: widget.SId,
                                        title: itemnameController.text,
                                        price: int.parse(priceController.text),
                                        description: descriptionController.text,
                                        quandity:
                                            int.parse(quandityController.text),
                                        review: reviewController.text,
                                        rate: double.parse(rateController.text),
                                        seller: sellerController.text,
                                        category: categoryController.text);

                                    productViewModel.updateProduct(
                                      product: updatedProduct,
                                      imageFile: File(pickedImage!.path),
                                      context: context,
                                    );
                                  }
                                },
                                name: 'Update Product',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  productViewModel.deleteProduct(
                                    productId: widget.SId,
                                    context: context,
                                  );
                                },
                                child: Text('Delete Product'),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
