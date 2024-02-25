import 'package:filmex/core/network/api_constance.dart';
import 'package:filmex/filmex/domain/entities/filmex.dart';

class FilmexModel extends Filmex{
  const FilmexModel({required super.id, required super.title, required super.overview, required super.backdropPath, required super.genreIds, required super.voteAverage, required super.releaseDate});

  factory FilmexModel.fromJSON(Map<String, dynamic> json)=>
      FilmexModel(
         id: json['id'],
         title: json['title'],
        overview: json['overview'],
         backdropPath: json['backdrop_path']?? ApiConstance.imageEmpty_,
         genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
         voteAverage: json['vote_average'].toDouble(),
         releaseDate: json['release_date']
      );


}