import 'package:equatable/equatable.dart';

class MovieGenreRepoModel extends Equatable {
  final int id;
  final String name;

  const MovieGenreRepoModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory MovieGenreRepoModel.fromJson(Map<String, dynamic> map) {
    return MovieGenreRepoModel(
      id: map['id'],
      name: map['name'],
    );
  }

  @override
  List<Object?> get props => [];
}
