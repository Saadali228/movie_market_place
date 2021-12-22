part of 'movie_bloc.dart';

enum MovieStatus { initial, loading, loaded, error }

class MovieState extends Equatable {
  final MovieStatus movieStatus;
  final List<MovieRepoModel> movieList;
  const MovieState({
    this.movieStatus = MovieStatus.initial,
    this.movieList = const [],
  });
  MovieState copyWith(
      {MovieStatus? movieStatus, List<MovieRepoModel>? movieList}) {
    return MovieState(
        movieList: movieList ?? this.movieList,
        movieStatus: movieStatus ?? this.movieStatus);
  }

  @override
  List<Object> get props => [movieStatus, movieList];
}

