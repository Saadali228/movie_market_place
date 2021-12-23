import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';
import 'package:movie_market_place/home_page/widgets/app_bar.dart';
import 'package:movie_market_place/home_page/widgets/movie_carousel.dart';
import 'package:movie_market_place/home_page/widgets/movie_discover.dart';
import 'package:movie_market_place/home_page/widgets/movie_popular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2d2d2d),
      body: ListView(
        children: const [
          Appbar(),
          SizedBox(height: 30),
          MovieCarousel(),
          SizedBox(height: 10),
          MovieDiscover(),
          MoviePopular(),
        ],
      ),
    );
  }
}
