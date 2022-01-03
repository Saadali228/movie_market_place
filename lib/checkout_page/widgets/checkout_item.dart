import 'package:flutter/material.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({Key? key, required this.item}) : super(key: key);
  final CartRepoModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(
            'https://image.tmdb.org/t/p/w185/${item.image}',
            height: 90,
            width: 70,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                item.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: Text(
              "\$" + item.price.toString(),
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Expanded(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [

          //     ],
          //   ),
          // ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: <Widget>[
          //     IconButton(
          //       onPressed: onDelete,
          //       icon: const Icon(
          //         Icons.delete,
          //         color: Colors.red,
          //         size: 18,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
