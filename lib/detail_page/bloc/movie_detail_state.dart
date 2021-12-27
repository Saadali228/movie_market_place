part of 'movie_detail_bloc.dart';

enum MovieDetailStatus { initial, loading, loaded, error }

class MovieDetailState extends Equatable {
  final MovieDetailStatus movieDetailStatus;
  final MovieDetailRepoModel? movieDetails;
  const MovieDetailState({
    this.movieDetailStatus = MovieDetailStatus.initial,
    this.movieDetails,
  });
  MovieDetailState copyWith(
      {MovieDetailStatus? movieDetailStatus, MovieDetailRepoModel? movieDetails}) {
    return MovieDetailState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailStatus: movieDetailStatus ?? this.movieDetailStatus);
  }

  @override
  List<Object?> get props => [movieDetailStatus, movieDetails];
}