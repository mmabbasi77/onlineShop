import 'package:flutter/material.dart';
import 'package:online_shop/detailScreen.dart';
import 'package:online_shop/models/MyProduct.dart';
import 'package:online_shop/widgets/ProductCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(size.height * 2 / 75),
          child: Column(
            children: [
              Text(
                "Our Products",
                style: TextStyle(
                    fontSize: size.height * 2.7 / 75,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildProductCategory(
                      index: 0, name: "All Products", size: size),
                  buildProductCategory(index: 1, name: "Jackets", size: size),
                  buildProductCategory(index: 2, name: "Sneakers", size: size),
                ],
                // buildAllProducts
              ),
              SizedBox(
                height: size.height * 2 / 75,
              ),
              SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  height: size.height * 40 / 75,
                  child: isSelected == 0
                      ? buildAllProducts()
                      : isSelected == 1
                          ? buildJackets()
                          : buildSneakers(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildProductCategory(
      {required int index, required String name, required Size size}) {
    return GestureDetector(
      onTap: () => setState(() {
        isSelected = index;
      }),
      child: Container(
        width: size.height * 10 / 75,
        height: size.height * 4 / 75,
        margin: const EdgeInsets.only(top: 10, right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected == index ? Colors.red : Colors.red.shade300,
            borderRadius: BorderRadius.circular(8)),
        child: Text(name, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  buildAllProducts() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      scrollDirection: Axis.vertical,
      itemCount: MyProduct.allProducts.length,
      itemBuilder: (context, index) {
        final allProducts = MyProduct.allProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(product: allProducts);
            }));
          },
          child: ProductCard(
            product: allProducts,
          ),
        );
      },
    );
  }

  buildJackets() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      scrollDirection: Axis.vertical,
      itemCount: MyProduct.jacketsList.length,
      itemBuilder: (context, index) {
        final jaketsList = MyProduct.jacketsList[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(product: jaketsList);
              }));
            },
            child: ProductCard(product: jaketsList));
      },
    );
  }

  buildSneakers() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      scrollDirection: Axis.vertical,
      itemCount: MyProduct.sneakersList.length,
      itemBuilder: (context, index) {
        final sneakersList = MyProduct.sneakersList[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(product: sneakersList);
              }));
            },
            child: ProductCard(product: sneakersList));
      },
    );
  }
}
