import 'package:eccomerce_app/data/model/grocery_item.dart';
import 'package:eccomerce_app/service/bloc/home_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTile extends StatelessWidget {
  final HomeBlocBloc homeBloc;
  final GroceryItem groceryItem;
  const ItemTile(
      {super.key, required this.groceryItem, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      color: Colors.green,
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: 400,
            height: 100,
            child: Image(image: NetworkImage(groceryItem.image.toString())),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                child: Text(
                  "\$" + groceryItem.price.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20.0),
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    BlocProvider.of<HomeBlocBloc>(context)
                        .add(WishlistButtonClicked(item: groceryItem));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10.0),
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.shopping_cart_checkout_outlined),
                  onPressed: () {
                    BlocProvider.of<HomeBlocBloc>(context)
                        .add(CartButtonClicked(item: groceryItem));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
