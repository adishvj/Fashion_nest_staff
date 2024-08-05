// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:user/Screens/update_screen.dart';
//
// import '../models/product_model2.dart';
// import '../view_model/product_view_model.dart';
// import '../widgets/custom_item.dart';
//
// class Nike extends StatefulWidget {
//   Nike({Key? key}) : super(key: key);
//
//   @override
//   State<Nike> createState() => _FoodState();
// }
//
// class _FoodState extends State<Nike> {
//   String _searchQuery = '';
//   final TextEditingController _searchController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<ProductViewModel>(context, listen: false).fetchProducts();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Update Products"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 setState(() {
//                   _searchQuery = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 fillColor: Colors.white,
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(color: Colors.grey)),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(color: Colors.grey)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(color: Colors.green)),
//                 hintText: "Looking for shoes",
//                 prefixIcon: Icon(
//                   Icons.search,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Consumer<ProductViewModel>(
//               builder: (context, viewModel, child) {
//                 if (viewModel.loading) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//
//                 List<ProductModel> filteredFoodItems = viewModel.products
//                     .where((item) =>
//                         item.title != null &&
//                         item.title!
//                             .toLowerCase()
//                             .contains(_searchQuery.toLowerCase()))
//                     .toList()
//                     .reversed
//                     .toList();
//
//                 return GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 0,
//                     mainAxisSpacing: 10,
//                     childAspectRatio: 0.82,
//                   ),
//                   itemCount: filteredFoodItems.length,
//                   itemBuilder: (context, index) {
//                     final item = filteredFoodItems[index];
//                     return custom_items(
//                       image: item.image ?? '',
//                       title: item.title ?? '',
//                       price: (item.price ?? 0).toString(),
//                       index: index,
//                       onTapFull: () {},
//                       onTapadd: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => UpdateProduct(
//                               SId: item.sId ?? "",
//                               title: item.title ?? "",
//                               price: item.price ?? 0,
//                               image: item.image ?? "",
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/Screens/update_screen.dart';

import '../Widgets/custom_item.dart';
import '../models/product_model2.dart';
import '../view_model/product_view_model.dart';

class Nike extends StatefulWidget {
  Nike({Key? key}) : super(key: key);

  @override
  State<Nike> createState() => _FoodState();
}

class _FoodState extends State<Nike> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductViewModel>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Text(
          "Update Products",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                fillColor: Color(0xFF201c1c),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                hintText: "Looking for shoes",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<ProductViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.loading) {
                  return Center(child: CircularProgressIndicator());
                }

                List<ProductModel> filteredFoodItems = viewModel.products
                    .where((product) =>
                        product.title != null &&
                        product.title!
                            .toLowerCase()
                            .contains(_searchQuery.toLowerCase()))
                    .toList()
                    .reversed
                    .toList();

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.82,
                  ),
                  itemCount: filteredFoodItems.length,
                  itemBuilder: (context, index) {
                    final product = filteredFoodItems[index];
                    return custom_items(
                      image: product.image ?? '',
                      title: product.title ?? '',
                      price: (product.price ?? 0).toString(),
                      index: index,
                      onTapFull: () {},
                      onTapadd: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateProduct(
                              SId: product.sId ?? "",
                              itemname: product.title ?? "",
                              price: product.price ?? 0,
                              image: product.image ?? "",
                              description: product.description ?? "",
                              quandity: product.quandity,
                              review: product.review ?? "",
                              seller: product.seller ?? "",
                              category: product.category ?? "",
                              rate: product.rate!,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
