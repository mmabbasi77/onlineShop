import 'package:flutter/material.dart';
import 'package:online_shop/providers/FavoriteProvider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: size.height * 2 / 75, left: size.height * 2 / 75),
          child: Row(
            children: [
              Text(
                "Favorites",
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
                          fontSize: size.height * 1.5 / 75,
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
                    trailing: Text(
                      "\$${finalList[index].price}",
                      style: TextStyle(
                          fontSize: size.height * 2 / 75,
                          fontWeight: FontWeight.bold),
                    ),
                    tileColor: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
