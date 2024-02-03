import 'package:flutter/material.dart';
import 'package:online_shop/CartDetails.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/providers/CartProvider.dart';
import 'package:online_shop/widgets/availableSize.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: size.height * 22 / 75,
            height: size.height * 22 / 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red.shade100,
            ),
            child: Image.asset(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: size.height * 3.6 / 75),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 3.6 / 75),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(size.height / 75),
                    width: double.infinity,
                    height: size.height * 40 / 75,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name.toUpperCase(),
                              style: TextStyle(
                                fontSize: size.height * 2.6 / 75,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$" "${product.price}",
                              style: TextStyle(
                                fontSize: size.height * 2.2 / 75,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 1.4 / 75),
                        Text(
                          product.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: size.height * 1.4 / 75),
                        ),
                        SizedBox(height: size.height * 2.5 / 75),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Available Size",
                              style: TextStyle(
                                fontSize: size.height * 1.8 / 75,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.8 / 75),
                        const Row(
                          children: [
                            AvailableSize(size: "US 6"),
                            AvailableSize(size: "US 7"),
                            AvailableSize(size: "US 8"),
                            AvailableSize(size: "US 9"),
                          ],
                        ),
                        SizedBox(height: size.height * 2.5 / 75),
                        Text(
                          "Available Colors",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: size.height * 1.8 / 75,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.blue,
                            ),
                            SizedBox(width: size.height * 0.8 / 75),
                            const CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.red,
                            ),
                            SizedBox(width: size.height * 0.8 / 75),
                            const CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.amber,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.height * 2 / 75),
          alignment: Alignment.center,
          width: double.infinity,
          height: size.height / 10,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" "${product.price}",
                style: TextStyle(
                  fontSize: size.height * 3.4 / 75,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  provider.toggleProduct(product);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CartDetails();
                  }));
                },
                icon: const Icon(Icons.send),
                label: const Text("Add to Cart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
