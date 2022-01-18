import 'package:movie_market_place/home_page/data_layer/movie_data_layer.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_genre.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';

class MovieRepoLayer {
  final MovieDataLayer _dataProvider;

  MovieRepoLayer(this._dataProvider);

  Future<List<MovieRepoModel>> getMovies(int page) async {
    var _moviesList = await _dataProvider.getMovies(page);
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

  Future<List<MovieRepoModel>> getMoviesWithFilters(
    int page, {
    int? year,
    MovieGenreRepoModel? genre,
  }) async {
    var _moviesList = await _dataProvider.getMoviesWithFilter(
      page,
      year: year,
      genre: genre,
    );
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
