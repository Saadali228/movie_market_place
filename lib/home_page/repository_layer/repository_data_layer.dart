import 'package:movie_market_place/home_page/data_layer/movie_data_layer.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';

class MovieRepository {
  final MovieDataLayer _dataProvider;

  MovieRepository(this._dataProvider);

  Future<void> initializeMovies() async {
    await _dataProvider.initializeMovies();
  }

  Future<List<MovieRepoModel>> getMovies() async {
    var _moviesList = await _dataProvider.getMovies();
    if (_moviesList.isEmpty) {
      await _dataProvider.initializeMovies();
      _moviesList = await _dataProvider.getMovies();
    }
    return _moviesList
        .map(
          (e) => MovieRepoModel(
            id: e.id,
            title: e.title,
            image: e.image,
            poster: e.poster,
          ),
        )
        .toList();
  }
}
