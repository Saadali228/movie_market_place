import 'package:equatable/equatable.dart';

class MovieRepoModel extends Equatable {
  final int id;
  final String title;
  final String posterPath;

  const MovieRepoModel({
    required this.id,
    required this.title,
    required this.posterPath,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
    };
  }

  factory MovieRepoModel.fromJson(Map<String, dynamic> map) {
    return MovieRepoModel(
      id: map['id'],
      title: map['title'],
      posterPath: map['poster_path'],
    );
  }

  @override
  List<Object?> get props => [];
}
