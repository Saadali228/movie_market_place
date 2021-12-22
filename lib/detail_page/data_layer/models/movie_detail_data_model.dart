import 'package:equatable/equatable.dart';

class MovieDetailDataModel extends Equatable {
  final int id;
  final String? title;
  final String? tagline;
  final String? image;
  final String? poster;
  final String? overview;
  final String? release;
  final List? genres;
  final List? companies;

  const MovieDetailDataModel({
    required this.id,
    this.title,
    this.tagline,
    this.image,
    this.poster,
    this.overview,
    this.release,
    this.genres,
    this.companies,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'tagline': tagline,
      'backdrop_path': image,
      'poster_path': poster,
      'overview': overview,
      'release_date': release,
      'genres': genres,
      'production_companies': companies,
    };
  }

  factory MovieDetailDataModel.fromJson(Map<String, dynamic> map) {
    return MovieDetailDataModel(
      id: map['id'],
      title: map['title'],
      tagline: map['tagline'],
      image: map['backdrop_path'],
      poster: map['poster_path'],
      overview: map['overview'],
      release: map['release_date'],
      genres: map['genres'],
      companies: map['production_companies'],
    );
  }

  @override
  List<Object?> get props => [];
}
