import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_market_place/search/repository_layer/models/search_repo_model.dart';
import 'package:movie_market_place/search/repository_layer/search_repo_layer.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepoLayer searchRepoLayer;

  SearchBloc(this.searchRepoLayer) : super(const SearchState()) {
    on<SearchItemsLoaded>(
      (event, emit) async {
        if (event.text.isEmpty) {
          emit(
            state.copyWith(
              searchStatus: SearchStatus.initial,
            ),
          );
        } else {
          emit(
            state.copyWith(
              searchStatus: SearchStatus.loading,
            ),
          );
        }
        final _searchItems = await searchRepoLayer.searchMovies(event.text);
        emit(
          state.copyWith(
            searchStatus: SearchStatus.loaded,
            searchItems: _searchItems,
          ),
        );
      },
    );
  }
}
