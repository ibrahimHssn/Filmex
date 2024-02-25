import 'package:filmex/core/network/api_constance.dart';
import 'package:filmex/filmex/domain/entities/filmex_detail.dart';
import 'genres_model.dart';

class FilmexDetailsModel extends FilmexDetail{
  const FilmexDetailsModel(
      {required super.id,
       super.backdropPath,
      required super.overview,
      required super.title,
      required super.voteAverage,
      required super.releaseDate,
      required super.runtime,
      required super.genres});

  factory FilmexDetailsModel.fromJSON(Map<String, dynamic>json)=>
      FilmexDetailsModel(
          id: json['id'],
          backdropPath: json['backdrop_path'] ?? ApiConstance.imageEmpty_,
          overview: json['overview'],
          title: json['title'],
          voteAverage: json['vote_average'].toDouble(),
          releaseDate: json['release_date'],
          runtime: json['runtime'],
          genres: List<GenresModel>.from(json['genres'].map((e)=>GenresModel.fromJSON(e))),
      );
}