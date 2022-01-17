import 'package:equatable/equatable.dart';
import 'package:movie_market_place/search/repository_layer/models/search_item_repo_model.dart';

class SearchRepoModel extends Equatable {
  const SearchRepoModel({required this.searchItems});

  final List<SearchItemRepoModel>? searchItems;

  @override
  List<Object?> get props => [searchItems];
}