import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_market_place/home_page/widgets/movie_carousel.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';
import 'package:movie_market_place/home_page/widgets/movie_discover.dart';
import 'package:movie_market_place/home_page/widgets/movie_popular.dart';

class MovieHomePage extends StatelessWidget {
  final List<MovieRepoModel> movieList;

  const MovieHomePage({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Color(0x99ff0000),
                    Color(0x66ff0000),
                    Color(0x66ff0000),
                    Color(0x99ff0000),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    'Movie Mart',
                    style: GoogleFonts.eczar(
                      color: const Color(0xfff5f5f5),
                      fontWeight: FontWeight.w600,
                      fontSize: 40.0,
                    ),
                  ),
                ],
              ),
            ),
        const SizedBox(height: 30),
        MovieCarousel(movieList: movieList),
        const SizedBox(height: 10),
        const MovieDiscover(),
        MoviePopular(movieList: movieList),
      ],
    );
  }
}
