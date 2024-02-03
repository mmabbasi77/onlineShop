import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:online_shop/providers/CartProvider.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    _buildProductQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQuantity(index)
                : provider.decrementQuantity(index);
          });
        },
        child: Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.red.shade100),
          child: Icon(
            icon,
            size: size.height * 1.5 / 75,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 2 / 75, left: size.height * 2 / 75),
            child: Row(
              children: [
                Text(
                  "Cart",
                  style: TextStyle(
                      fontSize: size.height * 2.7 / 75,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(size.height * 0.8 / 75),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            finalList[index].quantity = 1;
                            finalList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: "Delete",
                        )
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        finalList[index].name,
                        style: TextStyle(
                            fontSize: size.height * 2 / 75,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        finalList[index].description,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(finalList[index].image),
                        backgroundColor: Colors.red.shade100,
                      ),
                      trailing: Column(
                        children: [
                          _buildProductQuantity(Icons.add, index),
                          Text(
                            finalList[index].quantity.toString(),
                            style: TextStyle(
                                fontSize: size.height * 1.4 / 75,
                                fontWeight: FontWeight.bold),
                          ),
                          _buildProductQuantity(Icons.remove, index)
                        ],
                      ),
                      tileColor: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.height * 2 / 75),
            alignment: Alignment.center,
            width: double.infinity,
            height: size.height * 10 / 75,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${provider.getTotalPrice()}",
                  style: TextStyle(
                      fontSize: size.height * 4 / 75,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
