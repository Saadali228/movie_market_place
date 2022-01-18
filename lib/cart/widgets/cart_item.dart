import 'package:flutter/material.dart';
import 'package:movie_market_place/cart/repository_layer/models/cart_repository_model.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {Key? key,
      required this.item,
      required this.onDelete,
      required this.animation})
      : super(key: key);
  final CartRepoModel item;
  final Function() onDelete;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      key: ValueKey(item.image),
      sizeFactor: animation,
      child: SizedBox(
        height: 100,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w185/${item.image}',
                height: 60,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 60,
                    color: Colors.white,
                    child: const Icon(
                      Icons.person,
                      color: Color(0xff322043),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        item.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
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
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
