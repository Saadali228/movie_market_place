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

        final movieRepoList =
            await movieRepository.getMovies(state.page, null, null, null);
        final genreRepoList = await movieRepository.getGenres();
        emit(state.copyWith(
          movieStatus: MovieStatus.loaded,
          movieList: movieRepoList,
          // page: state.page,
          genreList: genreRepoList,
          sortBy: state.sortBy,
        ));
      },
    );
    // final movieRepoList = await movieRepository.getMovies(state.page, null);
    // emit(state.copyWith(
    //   movieStatus: MovieStatus.loaded,
    //   movieList: movieRepoList,
    //   //  page: state.page,
    //   sortBy: state.sortBy,
    // ));
    //   },
    // );

    on<MovieNextPageFetched>(
      (event, emit) async {
        emit(state.copyWith(pageLoader: PageLoader.loading));

        var page = state.page + 1;
        final movieRepoList =
            await movieRepository.getMovies(page, null, null, null);
        var stateMovies = state.movieList;
        stateMovies.addAll(movieRepoList);
        emit(state.copyWith(
          pageLoader: PageLoader.loaded,
          movieList: stateMovies,
          page: page,
          sortBy: state.sortBy,
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
          null,
          event.year,
          state.selectedGenre,
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
    on<MovieGenre>((event, emit) async {
      emit(state.copyWith(
        pageLoader: PageLoader.loading,
      ));

      final movieRepoList = await movieRepository.getMovies(
        state.page,
        null,
        state.selectedYear,
        event.selectedGenre,
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
    });

    on<SortedMoviesFetched>(
      (event, emit) async {
        emit(
          state.copyWith(
            movieStatus: MovieStatus.loading,
          ),
        );

        final movieRepoList = await movieRepository.getMovies(
          state.page,
          event.sort.name,
          state.selectedYear,
          state.selectedGenre,
        );

        emit(
          state.copyWith(
            movieStatus: MovieStatus.loaded,
            movieList: movieRepoList,
            page: state.page,
            sortBy: event.sort,
            selectedYear: state.selectedYear,
            selectedGenre: state.selectedGenre,
          ),
        );
      },
    );
  }
}
