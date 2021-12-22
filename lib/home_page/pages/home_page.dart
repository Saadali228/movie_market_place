import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_market_place/cart/pages/cart_page.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';
import 'package:movie_market_place/home_page/pages/movie.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CartDrawer(),
      backgroundColor: const Color(0xff2d2d2d),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          switch (state.movieStatus) {
            case MovieStatus.initial:
              context.read<MovieBloc>().add(
                    MovieFetched(),
                  );
              return const _MovieInitial();
            case MovieStatus.loading:
              return const _MovieLoading();
            case MovieStatus.loaded:
              return _MovieLoaded(movieList: state.movieList);
            case MovieStatus.error:
            default:
              return const _MovieError();
          }
        },
      ),
    );
  }
}

class _MovieInitial extends StatelessWidget {
  const _MovieInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Movies are Empty!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}

class _MovieLoading extends StatelessWidget {
  const _MovieLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}

class _MovieLoaded extends StatelessWidget {
  final List<MovieRepoModel> movieList;

  const _MovieLoaded({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieHomePage(movieList: movieList);
  }
}

class _MovieError extends StatelessWidget {
  const _MovieError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Something went wrong!', style: TextStyle(fontSize: 64)),
      ],
    );
  }
}
