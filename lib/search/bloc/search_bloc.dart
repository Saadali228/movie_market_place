import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_market_place/search/repository_layer/models/search_repository_model.dart';
import 'package:movie_market_place/search/repository_layer/search_repository_layer.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepoLayer searchRepoLayer;

  SearchBloc(this.searchRepoLayer) : super(const SearchState()) {
    on<SearchItemsLoaded>(
      (event, emit) async {
        emit(
          state.copyWith(
            searchStatus: SearchStatus.loading,
          ),
        );
        final _searchItems = await searchRepoLayer.searchMovies(state.query);
        emit(
          state.copyWith(
            searchStatus: SearchStatus.loaded,
            searchItems: _searchItems,
            query: state.query,
          ),
        );
      },
    );
  }
}
