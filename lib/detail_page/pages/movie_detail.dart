import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_market_place/detail_page/repository_layer/models/movie_detail_repo_model.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieDetailRepoModel movieDetail;
  const MovieDetailPage({Key? key, required this.movieDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2d2d2d),
      body: Center(
        child: Text(
          movieDetail.title.toString(),
        style: const TextStyle(
          color: Colors.white, fontSize: 50.0,
        ),
        ),
      ),
    );
  }
}