import 'package:movie_market_place/home_page/data_layer/movie_data_layer.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';

class MovieRepoLayer {
  final MovieDataLayer _dataProvider;

  MovieRepoLayer(this._dataProvider);

  Future<List<MovieRepoModel>> getMovies(int page, String? sort) async {
    var _moviesList = await _dataProvider.getMovies(page, sort);
    return _moviesList
        .map(
          (e) => MovieRepoModel(
            id: e.id,
            title: e.title,
            image: e.image,
            poster: e.poster,
            overview: e.overview,
            price: e.price,
          ),
        )
        .toList();
  }
}
