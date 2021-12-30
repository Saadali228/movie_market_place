import 'package:equatable/equatable.dart';

class MovieDataModel extends Equatable {
  final int id;
  final String title;
  final String? image;
  final String? poster;
  final String overview;
  final num? price;

  const MovieDataModel({
    required this.id,
    required this.title,
    required this.image,
    required this.poster,
    required this.overview,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'backdrop_path': image,
      'poster_path': poster,
      'overview': overview,
    };
  }

  factory MovieDataModel.fromJson(Map<String, dynamic> map) {
    return MovieDataModel(
      id: map['id'],
      title: map['title'],
      image: map['backdrop_path'],
      poster: map['poster_path'],
      overview: map['overview'],
      price: map['vote_average'] * 10,
    );
  }

  @override
  List<Object?> get props => [];
}
