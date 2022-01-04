import 'package:flutter/material.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({Key? key, required this.item}) : super(key: key);
  final CartRepoModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(
            'https://image.tmdb.org/t/p/w185/${item.image}',
            height: 90,
            width: 70,
          ),
          const SizedBox(width: 8.0),
          Expanded(
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
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              "\$" + item.price.toString(),
              textAlign: TextAlign.right,
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
