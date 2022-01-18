part of 'search_bloc.dart';

enum SearchStatus { initial, loading, loaded, error }

class SearchState extends Equatable {
  const SearchState({
    this.searchStatus = SearchStatus.initial,
    this.searchItems,
  });

  final SearchStatus searchStatus;
  final SearchRepoModel? searchItems;

  SearchState copyWith({
    SearchStatus? searchStatus,
    SearchRepoModel? searchItems,
  }) {
    return SearchState(
      searchStatus: searchStatus ?? this.searchStatus,
      searchItems: searchItems ?? this.searchItems,
    );
  }

  @override
  List<Object?> get props => [searchStatus, searchItems];
}
