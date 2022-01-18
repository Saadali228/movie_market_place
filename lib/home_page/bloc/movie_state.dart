part of 'movie_bloc.dart';

enum MovieStatus {
  initial,
  loading,
  loaded,
  error,
}
enum PageLoader {
  initial,
  loading,
  loaded,
}

class MovieState extends Equatable {
  final MovieStatus movieStatus;
  final List<MovieRepoModel> movieList;
  final int page;
  final PageLoader pageLoader;
  final MovieGenreRepoModel? selectedGenre;
  final int selectedYear;
  // final ReleaseYearStatus releaseYearStatus;
  // final GenreStatus genreStatus;

  const MovieState({
    this.movieStatus = MovieStatus.initial,
    this.movieList = const [],
    this.page = 1,
    this.pageLoader = PageLoader.initial,
    this.selectedGenre = null,
    this.selectedYear = 0,
    // this.releaseYearStatus = ReleaseYearStatus.intial,
    // this.genreStatus = GenreStatus.intial,
  });

  MovieState copyWith({
    MovieStatus? movieStatus,
    List<MovieRepoModel>? movieList,
    int? page,
    PageLoader? pageLoader,
    final MovieGenreRepoModel? selectedGenre,
    int? selectedYear,
    // ReleaseYearStatus? releaseYearStatus,
    // GenreStatus? genreStatus,
  }) {
    return MovieState(
      movieList: movieList ?? this.movieList,
      movieStatus: movieStatus ?? this.movieStatus,
      page: page ?? this.page,
      pageLoader: pageLoader ?? this.pageLoader,
      selectedGenre: selectedGenre ?? this.selectedGenre,
      selectedYear: selectedYear ?? this.selectedYear,
      // releaseYearStatus: releaseYearStatus ?? this.releaseYearStatus,
      // genreStatus: genreStatus ?? this.genreStatus,
    );
  }

  @override
  List<Object> get props => [
        movieStatus,
        movieList,
        page,
        pageLoader,
        selectedGenre!,
        // releaseYearStatus,
        // genreStatus
      ];
}
