import 'package:flutter/material.dart';
import 'package:movie_market_place/account/repository_layer/models/account_repo_model.dart';

double _mobile = 700;

class WishlistGrid extends StatelessWidget {
  const WishlistGrid({
    Key? key,
    required this.item,
    required this.onDelete,
    // required this.animation,
  }) : super(key: key);

  final AccountRepoModel item;
  final Function() onDelete;
  // final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double mWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: mWidth * 0.7,
      child: Card(
        color: const Color(0xff361F41),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: size.width > _mobile
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w185/${item.image}',
                      scale: 3,
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          'Title: ${item.title}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          'Price: ${item.price}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Flexible(
                      child: SizedBox(
                        width: 150,
                        child: Text(
                          'Status: In Stock',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Flexible(
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          'Added on: 26/01/22',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 40,
                      onPressed: onDelete,
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w185/${item.image}',
                      scale: 3,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Title: ${item.title}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Price: ${item.price}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'Status: In Stock',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'Added on: 26/01/22',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    IconButton(
                      onPressed: onDelete,
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
