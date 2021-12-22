import 'package:equatable/equatable.dart';

class MovieRepoModel extends Equatable {
  final int id;
  final String title;
  final String image;
  final String poster;

  const MovieRepoModel({
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

  factory MovieRepoModel.fromJson(Map<String, dynamic> map) {
    return MovieRepoModel(
      id: map['id'],
      title: map['title'],
      image: map['backdrop_path'],
      poster: map['poster_path'],
    );
  }

  @override
  List<Object?> get props => [];
}
