import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_market_place/home_page/data_layer/models/movie_data_model.dart';

class MovieRequestFailure implements Exception {}

class MovieNotFoundFailure implements Exception {}

class MovieDataLayer {
  MovieDataLayer({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const _baseURL = 'api.themoviedb.org';
  static const _apiKey = '2e3196b2667f3f54ded1d98d15b5020d';

  Future<List<MovieDataModel>> getMovies(int page) async {
    final movieRequest = Uri.https(
      _baseURL,
      '/3/discover/movie',
      {
        'api_key': _apiKey,
        'page': page.toString(),
        'include_adult': false,
      },
    );
    final movieResponse = await _httpClient.get(movieRequest);
    if (movieResponse.statusCode != 200) {
      throw 'Movie Request Failure';
    }

    final bodyJson = jsonDecode(movieResponse.body) as Map<String, dynamic>;

    if (bodyJson.isEmpty) {
      throw 'Movie Not Found Failure';
    }

    final movieJson = bodyJson['results'] as List;

    if (movieJson.isEmpty) {
      throw 'Movie Not Found Failure';
    }
    final _movieList =
        movieJson.map((e) => MovieDataModel.fromJson(e)).toList();
    return _movieList;
  }
}
