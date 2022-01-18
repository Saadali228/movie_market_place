import 'package:equatable/equatable.dart';
import 'package:movie_market_place/search/repository_layer/models/search_item_repo_model.dart';

class SearchRepoModel extends Equatable {
  const SearchRepoModel({required this.searchList});

  final List<SearchItemRepoModel>? searchList;

  @override
  List<Object?> get props => [searchList];
}