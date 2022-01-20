import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_market_place/home_page/data_layer/models/movie_data_model.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_genre.dart';

import 'models/genre_data.dart';

class MovieRequestFailure implements Exception {}

class MovieNotFoundFailure implements Exception {}

class MovieDataLayer {
  MovieDataLayer({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const _baseURL = 'api.themoviedb.org';
  static const _apiKey = '2e3196b2667f3f54ded1d98d15b5020d';

  // Future<List<MovieDataModel>> getMovies(
  //   int page, {
  //   int? year,
  //   MovieGenreRepoModel? genre,
  // }) async {
  Future<List<MovieDataModel>> getMovies(int page, String? sortBy, 
    int? year,
    MovieGenreRepoModel? genre,
  ) async {
   String sort = (sortBy != null) ? '$sortBy.desc' : 'popularity.desc';
    final movieRequest = Uri.https(
      _baseURL,
      '/3/discover/movie',
      {
        'api_key': _apiKey,
        'page': page.toString(),
        'include_adult': false.toString(),
        'primary_release_year': year.toString(),
        'with_genres': genre?.id.toString(),
        'sort_by': sort,
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

  Future<List<MovieGenreDataModel>> getGenres() async {
    final genreRequest = Uri.https(
      _baseURL,
      // '/3/discover/movie',
      '/3/genre/movie/list',
      {
        'api_key': _apiKey,
        //         'primary_release_year': year,
//         'with_genres': genre!.id,
      },
    );
    final genreResponse = await _httpClient.get(genreRequest);
    if (genreResponse.statusCode != 200) {
      throw 'Genre Request Failure';
    }

    final bodyJson = jsonDecode(genreResponse.body) as Map<String, dynamic>;

    if (bodyJson.isEmpty) {
      throw 'Genre Not Found Failure';
    }

    final genreJson = bodyJson['genres'] as List;

    if (genreJson.isEmpty) {
      throw 'Genre Not Found Failure';
    }
    final _genreList =
        genreJson.map((e) => MovieGenreDataModel.fromJson(e)).toList();
    return _genreList;
  }

//   Future<List<MovieDataModel>> getMoviesWithFilter(
//     int page, {
//     int? year,
//     MovieGenreRepoModel? genre,
//   }) async {
//     final movieRequest = Uri.https(
//       _baseURL,
//       '/3/discover/movie',
//       {
//         'api_key': _apiKey,
//         'page': page.toString(),
//         'primary_release_year': year,
//         'with_genres': genre!.id,
//       },
//     );
//     final movieResponse = await _httpClient.get(movieRequest);
//     if (movieResponse.statusCode != 200) {
//       throw 'Movie Request Failure';
//     }

//     final bodyJson = jsonDecode(movieResponse.body) as Map<String, dynamic>;

//     if (bodyJson.isEmpty) {
//       throw 'Movie Not Found Failure';
//     }

//     final movieJson = bodyJson['results'] as List;

//     if (movieJson.isEmpty) {
//       throw 'Movie Not Found Failure';
//     }
//     final _movieList =
//         movieJson.map((e) => MovieDataModel.fromJson(e)).toList();
//     return _movieList;
//   }
}
