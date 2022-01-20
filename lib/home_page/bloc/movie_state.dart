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

enum SortBy { popularity, release, rating }

class MovieState extends Equatable {
  final MovieStatus movieStatus;
  final List<MovieRepoModel> movieList;
  final int page;
  final SortBy sortBy;
  final PageLoader pageLoader;
  final MovieGenreRepoModel? selectedGenre;
  final int? selectedYear;
  final List<MovieGenreRepoModel>? genreList;
  // final ReleaseYearStatus releaseYearStatus;
  // final GenreStatus genreStatus;

  const MovieState({
    this.movieStatus = MovieStatus.initial,
    this.movieList = const [],
    this.page = 1,
    this.sortBy = SortBy.popularity,
    this.pageLoader = PageLoader.initial,
    this.selectedGenre,
    this.selectedYear,
    this.genreList,

    // this.releaseYearStatus = ReleaseYearStatus.intial,
    // this.genreStatus = GenreStatus.intial,
  });

  MovieState copyWith({
    MovieStatus? movieStatus,
    List<MovieRepoModel>? movieList,
    int? page,
    SortBy? sortBy,
    PageLoader? pageLoader,
    MovieGenreRepoModel? selectedGenre,
    int? selectedYear,
    List<MovieGenreRepoModel>? genreList,
    // ReleaseYearStatus? releaseYearStatus,
    // GenreStatus? genreStatus,
  }) {
    return MovieState(
      movieList: movieList ?? this.movieList,
      movieStatus: movieStatus ?? this.movieStatus,
      page: page ?? this.page,
      sortBy: sortBy ?? this.sortBy,
      pageLoader: pageLoader ?? this.pageLoader,
      selectedGenre: selectedGenre ?? this.selectedGenre,
      selectedYear: selectedYear ?? this.selectedYear,
      genreList: genreList ?? this.genreList,
      // releaseYearStatus: releaseYearStatus ?? this.releaseYearStatus,
      // genreStatus: genreStatus ?? this.genreStatus,
    );
  }

  @override
  List<Object?> get props => [
        movieStatus,
        movieList,
        page,
        sortBy,
        pageLoader,
        selectedGenre,
        selectedYear,
        genreList,
        // releaseYearStatus,
        // genreStatus
      ];
}
