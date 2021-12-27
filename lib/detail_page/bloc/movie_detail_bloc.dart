import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_market_place/detail_page/repository_layer/models/movie_detail_repo_model.dart';
import 'package:movie_market_place/detail_page/repository_layer/movie_detail_repo_layer.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieDetailRepoLayer movieRepository;
  final int id;

  MovieDetailBloc(this.movieRepository,this.id) : super(const MovieDetailState()) {
    on<MovieDetailFetched>(
      (event, emit) async {
        emit(
          state.copyWith(
            movieDetailStatus: MovieDetailStatus.loading,
          ),
        );
        final movieDetail = await movieRepository.getMovieDetail(id);
        emit(state.copyWith(
            movieDetailStatus: MovieDetailStatus.loaded,
            movieDetails: movieDetail));
      },
    );
  }
}
