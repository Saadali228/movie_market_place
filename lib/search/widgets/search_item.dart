import 'package:flutter/material.dart';
import 'package:movie_market_place/search/repository_layer/models/search_item_repo_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key, required this.searchItem}) : super(key: key);

  final SearchItemRepoModel? searchItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w185/${searchItem?.poster}',
              height: 90,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 90,
                  color: Colors.white,
                  child: const Icon(
                    Icons.person,
                    color: Color(0xff322043),
                  ),
                );
              },
            ),
            const SizedBox(width: 8.0),
            Column(
              children: [
                Text(
                  searchItem?.title ?? 'Unknown',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  searchItem?.overview ?? 'An Amazing Movie',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  searchItem?.price?.toString() ?? 'Out of Stock',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
