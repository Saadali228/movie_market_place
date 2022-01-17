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
        emit(
          state.copyWith(
            searchStatus: SearchStatus.loading,
          ),
        );
        final _searchItems = await searchRepoLayer.searchMovies(state.query);
        emit(
          state.copyWith(
            searchStatus: SearchStatus.loaded,
            query: event.text,
            searchItems: _searchItems,
            subTotal: calculateTotal(_searchItems),
          ),
        );
      },
    );
  }

   double calculateTotal(SearchRepoModel searchItem) {
    var ans = 0.0;
    for (var element in searchItem.searchItems ?? []) {
      ans += element.price ?? 0;
    }
    return ans;
  }
}
