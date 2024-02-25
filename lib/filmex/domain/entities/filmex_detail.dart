import 'package:equatable/equatable.dart';

import 'genres.dart';

class FilmexDetail extends Equatable{
  final int id;
  final String? backdropPath;
  final String overview;
  final String title;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final List<Genres> genres;

   const FilmexDetail( {
     required this.id,
      this.backdropPath,
     required this.overview,
     required this.title,
     required this.voteAverage,
     required this.releaseDate,
     required this.runtime,
     required this.genres,
   });




  @override
  List<Object?> get props => [id,backdropPath,overview,title,voteAverage,releaseDate,runtime,genres,];

}