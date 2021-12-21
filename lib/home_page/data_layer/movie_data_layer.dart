
import 'dart:convert';

import 'package:movie_market_place/fake_data/fake_data.dart';
import 'package:movie_market_place/home_page/data_layer/models/movie_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieDataLayer {
  Future<void> initializeMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('movieList', json.encode(fakeData));
  }

  Future<List<MovieDataModel>> getMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('movieList');
    if (userPref == null) return [];
    final map = json.decode(userPref) as List;
    final list = map.map((e) => MovieDataModel.fromJson(e)).toList();
    return list;
  }
}