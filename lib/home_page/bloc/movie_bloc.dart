import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_genre.dart';
import 'package:movie_market_place/home_page/repository_layer/models/movie_repo_model.dart';
import 'package:movie_market_place/home_page/repository_layer/movie_repo_layer.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepoLayer movieRepository;

  MovieBloc(this.movieRepository) : super(const MovieState()) {
    on<MovieFetched>(
      (event, emit) async {
        emit(
          state.copyWith(
            movieStatus: MovieStatus.loading,
          ),
        );

        final movieRepoList = await movieRepository.getMovies(state.page);
        final genreRepoList = await movieRepository.getGenres();
        emit(state.copyWith(
          movieStatus: MovieStatus.loaded,
          movieList: movieRepoList,
          page: state.page,
          genreList: genreRepoList,
        ));
      },
    );
    on<MovieNextPageFetched>(
      (event, emit) async {
        emit(state.copyWith(pageLoader: PageLoader.loading));

        var page = state.page + 1;
        final movieRepoList = await movieRepository.getMovies(page);
        var stateMovies = state.movieList;
        stateMovies.addAll(movieRepoList);
        emit(state.copyWith(
          pageLoader: PageLoader.loaded,
          movieList: stateMovies,
          page: page,
        ));
      },
    );
    on<MovieSelectedReleaseYear>(
      (event, emit) async {
        emit(state.copyWith(
          pageLoader: PageLoader.loading,
        ));

        final movieRepoList = await movieRepository.getMovies(
          state.page,
          year: event.year,
          genre: state.selectedGenre,
        );
        // var page = state.page + 1;
        // var stateMovies = state.movieList;
        // stateMovies.addAll(movieRepoList);
        emit(state.copyWith(
          pageLoader: PageLoader.loaded,
          movieList: movieRepoList,
          selectedYear: event.year,
          selectedGenre: state.selectedGenre,
          // page: page,
        ));
      },
    );
    on<MovieGenre>(
      (event, emit) async {
        emit(state.copyWith(
          pageLoader: PageLoader.loading,
        ));

        final movieRepoList = await movieRepository.getMovies(
          state.page,
          year: state.selectedYear,
          genre: event.selectedGenre,
        );
        // var page = state.page + 1;
        // var stateMovies = state.movieList;
        // stateMovies.addAll(movieRepoList);
        emit(state.copyWith(
          pageLoader: PageLoader.loaded,
          movieList: movieRepoList,
          selectedYear: state.selectedYear,
          selectedGenre: event.selectedGenre,
        ));
      },
    );
  }
}
