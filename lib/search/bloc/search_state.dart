part of 'search_bloc.dart';

enum SearchStatus { initial, loading, loaded, error }

class SearchState extends Equatable {
  const SearchState({
    this.searchStatus = SearchStatus.initial,
    this.searchItems,
    this.query = '',
    this.subTotal = 0,
  });

  final SearchStatus searchStatus;
  final SearchRepoModel? searchItems;
  final String query;
  final double subTotal;

  SearchState copyWith({
    SearchStatus? searchStatus,
    SearchRepoModel? searchItems,
    String? query,
    double? subTotal,
  }) {
    return SearchState(
      searchStatus: searchStatus ?? this.searchStatus,
      searchItems: searchItems ?? this.searchItems,
      query: query ?? this.query,
      subTotal: subTotal ?? this.subTotal,
    );
  }

  @override
  List<Object?> get props => [searchStatus, searchItems, query, subTotal];
}
