import 'package:movie_market_place/detail_page/data_layer/movie_detail_data_layer.dart';
import 'package:movie_market_place/detail_page/repository_layer/models/movie_detail_repo_model.dart';

class MovieDetailRepoLayer {
  final MovieDetailDataLayer _dataProvider;

  MovieDetailRepoLayer(this._dataProvider);

  Future<MovieDetailRepoModel> getMovieDetail(int id) async {
    var _moviesDetail = await _dataProvider.getMovieDetail(id);
    return MovieDetailRepoModel(
      id: id,
      title: _moviesDetail.title,
      tagline: _moviesDetail.tagline,
      image: _moviesDetail.image,
      overview: _moviesDetail.overview,
      poster: _moviesDetail.poster,
      release: _moviesDetail.release,
      genres: _moviesDetail.genres,
      companies: _moviesDetail.genres,
    );
  }
}
