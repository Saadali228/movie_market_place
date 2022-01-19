import 'package:equatable/equatable.dart';

class MovieGenreDataModel extends Equatable {
  final int id;
  final String name;

  const MovieGenreDataModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory MovieGenreDataModel.fromJson(Map<String, dynamic> map) {
    return MovieGenreDataModel(
      id: map['id'],
      name: map['name'],
    );
  }

  @override
  List<Object?> get props => [];
}
