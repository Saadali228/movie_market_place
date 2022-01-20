part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable {}

class MovieFetched extends MovieEvent {
  @override
  List<Object?> get props => [];
}

class MovieNextPageFetched extends MovieEvent {
  @override
  List<Object?> get props => [];
}

class MovieSelectedReleaseYear extends MovieEvent {
  MovieSelectedReleaseYear(this.year);
  final int year;
  @override
  List<Object?> get props => [];
}

class MovieGenre extends MovieEvent {
  MovieGenre(this.selectedGenre);
  final MovieGenreRepoModel selectedGenre;
  @override
  List<Object?> get props => [];
}
class SortedMoviesFetched extends MovieEvent {
  SortedMoviesFetched({required this.sort});

  final SortBy sort;

  @override
  List<Object?> get props => [sort];
}
