import 'package:movie_market_place/search/data_layer/search_data_layer.dart';
import 'package:movie_market_place/search/repository_layer/models/search_item_repo_model.dart';
import 'package:movie_market_place/search/repository_layer/models/search_repo_model.dart';

class SearchRepoLayer {
  SearchRepoLayer(this._searchDataLayer);

  final SearchDataLayer _searchDataLayer;

  Future<SearchRepoModel> searchMovies(String query) async {
    var _searchItems = await _searchDataLayer.searchMovies(query);
    return SearchRepoModel(
      searchItems: _searchItems.searchList
          ?.map(
            (e) => SearchItemRepoModel(
              id: e.id,
              title: e.title,
              image: e.image,
              poster: e.poster,
              overview: e.overview,
              price: e.price,
            ),
          )
          .toList(),
    );
  }
}
