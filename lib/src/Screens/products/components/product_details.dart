import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

final List<String> imagesList = [
  "assets/images/bike.jpg",
  "assets/images/cycle.jpg",
  "assets/images/bike1.jpg",
  "assets/images/bike.jpg",
  "assets/images/bike.jpg",
];

class ProductDetails extends StatefulWidget {
  static const routerName = '/productdetails';
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var rating = 3.0;

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Container(
              height: 350,
              width: double.infinity,
              padding: new EdgeInsets.all(40.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white)),
                color: Colors.white,
                elevation: 10,
                child: Column(
                  children: <Widget>[
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                        // enlargeCenterPage: true,
                        //scrollDirection: Axis.vertical,
                        onPageChanged: (index, reason) {
                          setState(
                            () {
                              _currentIndex = index;
                            },
                          );
                        },
                      ),
                      items: imagesList
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                margin: const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0,
                                ),
                                elevation: 6.0,
                                shadowColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 230,
                                        width: 280,
                                        child: Image.asset(
                                          "assets/images/bike.jpg",
                                          fit: BoxFit.cover,
                                          width: 250,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imagesList.map((urlOfItem) {
                        int index = imagesList.indexOf(urlOfItem);
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? const Color.fromRGBO(0, 0, 0, 0.8)
                                : const Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                        );
                      }).toList(),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Text(
                            "Product Name",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: const Text(
                            "Price : 25000",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: const Text("Seller Name",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 55)),
                        SmoothStarRating(
                          rating: rating,
                          isReadOnly: false,
                          size: 25,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star_half,
                          defaultIconData: Icons.star_border,
                          starCount: 5,
                          allowHalfRating: true,
                          spacing: 0.1,
                          onRated: (value) {
                            print("rating value -> $value");
                            // print("rating value dd -> ${value.truncate()}");
                          },
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 50),
                child: const Text(
                  "Details",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                      color: Colors.lightGreen),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 120),
                child: ElevatedButton(
                  child: const Text("Add to Cart"),
                  onPressed: () {
                    print("Add To Cart");
                  },
                ),
              )
            ],
          ),
          Container(
              height: 210,
              width: double.infinity,
              padding: new EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: Column(
                    children: const <Widget>[
                      ListTile(
                        leading: Text("Make :",
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 22,
                                fontWeight: FontWeight.w800)),
                        title: Text("Bajaj",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800)),
                      ),
                      ListTile(
                        leading: Text("Model :",
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 22,
                                fontWeight: FontWeight.w800)),
                        title: Text("Discover",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800)),
                      ),
                      ListTile(
                        leading: Text("Year :",
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 22,
                                fontWeight: FontWeight.w800)),
                        title: Text("2015",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800)),
                      ),
                      ListTile(
                        leading: Text("Mileage :",
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 22,
                                fontWeight: FontWeight.w800)),
                        title: Text("50,000 km",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800)),
                      ),
                    ],
                  ),
                ),
              )),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 100),
                child: ElevatedButton(
                  child: const Text(
                    "BUY",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    print("BUY");
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: ElevatedButton(
                  child: const Text(
                    "Chat",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    print("BUY");
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
