import 'package:flutter/material.dart';
import 'package:new_project/src/Screens/products/components/chat_scree.dart';
import 'package:new_project/src/Screens/products/components/product_details.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductList extends StatelessWidget {
  var rating = 3.0;
  List<String> images = [
    "assets/images/bike.jpg",
    "assets/images/cycle.jpg",
    "assets/images/bike1.jpg",
    "assets/images/bike.jpg",
    "assets/images/bike.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            height: 350,
            padding: new EdgeInsets.all(40.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white)),
              color: Colors.white,
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 70.0, left: 10),
                        child: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/Profil.png")),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                            height: 145,
                            width: 230,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, ProductDetails.routerName);

                                print("fff");
                              },
                              child: Image.asset(
                                'assets/images/bike.jpg',
                              ),
                            )),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 25.0,
                    ),
                    child: const Text(
                      "Product Name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 35.0,
                    ),
                    child: const Text(
                      "Price : 25000",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        child: const Text("Seller Name",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ),
                      const Padding(padding: EdgeInsets.all(20)),
                      SmoothStarRating(
                        rating: rating,
                        isReadOnly: false,
                        size: 25,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        starCount: 5,
                        allowHalfRating: true,
                        spacing: 2.0,
                        onRated: (value) {
                          print("rating value -> $value");
                          // print("rating value dd -> ${value.truncate()}");
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
