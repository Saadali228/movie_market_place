import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_market_place/search/data_layer/models/search_data_model.dart';

class SearchDataLayer {
  SearchDataLayer({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const _baseURL = 'api.themoviedb.org';
  static const _apiKey = '2e3196b2667f3f54ded1d98d15b5020d';

  Future<SearchDataModel> searchMovies(String query) async {
    final searchRequest = Uri.https(
      _baseURL,
      '/3/search/movie',
      {
        'api_key': _apiKey,
        'query': query,
        'include_adult': false,
      },
    );

    final searchResponse = await _httpClient.get(searchRequest);

    if (searchResponse.statusCode != 200) {
      throw 'Item Request Failure';
    }

    final bodyJson = jsonDecode(searchResponse.body) as Map<String, dynamic>;

    if (bodyJson.isEmpty) {
      throw 'Item Not Found Failure';
    }

    final _searchJson = bodyJson['results'];

    if (_searchJson.isEmpty) {
      throw 'Item Not Found';
    }

    return SearchDataModel.fromJson(_searchJson);
  }
}
