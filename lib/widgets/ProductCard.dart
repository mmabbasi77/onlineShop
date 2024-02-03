import 'package:flutter/material.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/providers/FavoriteProvider.dart';

class ProductCard extends StatefulWidget {
  ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.withOpacity(0.1)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  provider.toggleFavorite(widget.product);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    (provider.isExist(widget.product))
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(widget.product.image),
          ),
          Text(widget.product.name,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(widget.product.category,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.red,
              )),
          Text(
            "\$" "${widget.product.price}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
