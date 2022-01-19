part of 'movie_bloc.dart';

enum MovieStatus { initial, loading, loaded, error }
enum PageLoader { initial, loading, loaded }
enum SortBy { popularity, release, rating }

class MovieState extends Equatable {
  final MovieStatus movieStatus;
  final List<MovieRepoModel> movieList;
  final int page;
  final SortBy sortBy;
  final PageLoader pageLoader;

  const MovieState({
    this.movieStatus = MovieStatus.initial,
    this.movieList = const [],
    this.page = 1,
    this.sortBy = SortBy.popularity,
    this.pageLoader = PageLoader.initial,
  });

  MovieState copyWith({
    MovieStatus? movieStatus,
    List<MovieRepoModel>? movieList,
    int? page,
    SortBy? sortBy,
    PageLoader? pageLoader,
  }) {
    return MovieState(
      movieList: movieList ?? this.movieList,
      movieStatus: movieStatus ?? this.movieStatus,
      page: page ?? this.page,
      sortBy: sortBy ?? this.sortBy,
      pageLoader: pageLoader ?? this.pageLoader,
    );
  }

  @override
  List<Object> get props => [movieStatus, movieList, page, sortBy, pageLoader];
}
