
import 'package:equatable/equatable.dart';
import 'package:movie_market_place/search/data_layer/models/search_item_data_model.dart';

class SearchDataModel extends Equatable {
  const SearchDataModel({required this.searchList});

  final List<SearchItemDataModel>? searchList;

  factory SearchDataModel.fromJson(Map<String, dynamic> map) {
    return SearchDataModel(
        searchList: (map['results'] as List)
            .map((e) => SearchItemDataModel.fromJson(e))
            .toList());
  }

  @override
  List<Object?> get props => [searchList];
}
