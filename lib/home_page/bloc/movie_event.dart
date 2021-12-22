part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable {}

class MovieFetched extends MovieEvent {
  @override
  List<Object?> get props => [];
}
