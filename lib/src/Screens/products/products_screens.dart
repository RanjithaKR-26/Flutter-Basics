import 'package:flutter/material.dart';
import 'package:new_project/src/Screens/Profile/components/profile_form.dart';
import 'package:new_project/src/Screens/products/components/body.dart';
import 'package:new_project/src/Screens/products/components/posting_product.dart';
import 'package:new_project/src/Screens/products/components/product_list.dart';

class Products extends StatelessWidget {
  static const routerName = "/products";

  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group-3'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text(
              "Posting",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              print("post Data");
              Navigator.pushNamed(context, PostingProduct.routerName);
            },
          )
        ],
      ),
      body: Body(),
    );
  }
}
