import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_market_place/detail_page/data_layer/models/movie_detail_data_model.dart';

class MovieRequestFailure implements Exception {}

class MovieNotFoundFailure implements Exception {}

class MovieDetailDataLayer {
  MovieDetailDataLayer({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const _baseURL = 'api.themoviedb.org';
  static const _apiKey = '2e3196b2667f3f54ded1d98d15b5020d';

  Future<MovieDetailDataModel> getMovieDetail(int id) async {
    final movieRequest = Uri.https(
      _baseURL,
      '/3/movie/$id',
      {
        'api_key': _apiKey,
        'language': 'en-US',
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

    final movieJson = bodyJson;

    if (movieJson.isEmpty) {
      throw 'Movie Not Found Failure';
    }
    final _movieList =
    MovieDetailDataModel.fromJson(movieJson);
    return _movieList;
  }
}
