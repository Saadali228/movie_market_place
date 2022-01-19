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

class SortedMoviesFetched extends MovieEvent {
  SortedMoviesFetched({required this.sort});

  final SortBy sort;

  @override
  List<Object?> get props => [sort];
}
