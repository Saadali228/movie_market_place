import 'package:equatable/equatable.dart';

class MovieDataModel extends Equatable {
  final int id;
  final String title;
  final String? image;
  final String poster;

  const MovieDataModel({
    required this.id,
    required this.title,
    required this.image,
    required this.poster,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'backdrop_path': image,
      'poster_path': poster,
    };
  }

  factory MovieDataModel.fromJson(Map<String, dynamic> map) {
    return MovieDataModel(
      id: map['id'],
      title: map['title'],
      image: map['backdrop_path'],
      poster: map['poster_path'],
    );
  }

  @override
  List<Object?> get props => [];
}
