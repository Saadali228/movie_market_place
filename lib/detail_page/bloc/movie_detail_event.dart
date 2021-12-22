part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent extends Equatable {}

class MovieDetailFetched extends MovieDetailEvent {
  @override
  List<Object?> get props => [];
}