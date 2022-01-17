part of 'search_bloc.dart';

enum SearchStatus { initial, loading, loaded, error }

class SearchState extends Equatable {
  const SearchState({
    this.searchStatus = SearchStatus.initial,
    this.searchItems,
    this.query = '',
  });

  final SearchStatus searchStatus;
  final SearchRepoModel? searchItems;
  final String query;

  SearchState copyWith({
    final SearchStatus? searchStatus,
    final SearchRepoModel? searchItems,
    final String? query,
  }) {
    return SearchState(
      searchStatus: searchStatus ?? this.searchStatus,
      searchItems: searchItems ?? this.searchItems,
      query: query ?? this.query,
    );
  }

  @override
  List<Object?> get props => [searchStatus, searchItems, query];
}
