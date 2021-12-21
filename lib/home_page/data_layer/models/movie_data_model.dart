import 'package:equatable/equatable.dart';

class MovieDataModel extends Equatable {
  final int id;
  final String title;
  final String posterPath;

  const MovieDataModel({
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

  factory MovieDataModel.fromJson(Map<String, dynamic> map) {
    return MovieDataModel(
      id: map['id'],
      title: map['title'],
      posterPath: map['poster_path'],
    );
  }

  @override
  List<Object?> get props => [];
}
