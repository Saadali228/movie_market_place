import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';
import 'package:movie_market_place/home_page/repository_layer/movie_repo_layer.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepoLayer movieRepository;

  MovieBloc(this.movieRepository) : super(const MovieState()) {
    List<MovieRepoModel> list = [];
    int page = 1;
    on<MovieFetched>(
      (event, emit) async {
        emit(
          state.copyWith(
            movieStatus: MovieStatus.loading,
          ),
        );
        final movieList = await movieRepository.getMovies(page);
        page++;
        if (movieList.isEmpty) {
          list = movieList;
        } else {
          list.addAll(movieList);
        }
        emit(state.copyWith(
            movieStatus: MovieStatus.loaded, movieList: movieList));
      },
    );
  }
}
