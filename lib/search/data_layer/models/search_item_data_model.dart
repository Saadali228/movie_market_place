import 'package:equatable/equatable.dart';

class SearchItemDataModel extends Equatable {
  final int id;
  final String? title;
  final String? image;
  final String? poster;
  final String? overview;
  final num? price;

  const SearchItemDataModel({
    required this.id,
    required this.title,
    required this.image,
    required this.poster,
    required this.overview,
    required this.price,
  });

  factory SearchItemDataModel.fromJson(Map<String, dynamic> map) {
    return SearchItemDataModel(
      id: map['id'],
      title: map['title'],
      image: map['backdrop_path'],
      poster: map['poster_path'],
      overview: map['overview'],
      price: map['vote_average'] * 10,
    );
  }

  @override
  List<Object?> get props => [id, title, image, poster, overview, price];
}
