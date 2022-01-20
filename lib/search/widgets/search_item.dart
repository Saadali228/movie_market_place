import 'package:flutter/material.dart';
import 'package:movie_market_place/detail_page/pages/detail_page.dart';
import 'package:movie_market_place/search/repository_layer/models/search_item_repo_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key, required this.searchItem}) : super(key: key);

  final SearchItemRepoModel? searchItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => Navigator.pushNamed(
        context,
        DetailPage.detailPageRoute(
          searchItem?.id ?? 0,
        ),
      ),
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w185/${searchItem?.poster}',
                height: 120,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 120,
                    color: Colors.white,
                    child: const Icon(
                      Icons.person,
                      color: Color(0xff322043),
                    ),
                  );
                },
              ),
              const SizedBox(width: 8.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      searchItem?.title ?? 'Unknown',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      searchItem?.overview ?? 'No Overview',
                      textAlign: TextAlign.left,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$ ${searchItem?.price}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
