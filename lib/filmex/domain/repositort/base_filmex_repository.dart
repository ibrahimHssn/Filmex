import 'package:dartz/dartz.dart';
import 'package:filmex/core/error/failure.dart';
import 'package:filmex/filmex/domain/entities/filmex.dart';
import 'package:filmex/filmex/domain/entities/filmex_detail.dart';
import 'package:filmex/filmex/domain/entities/recommendations.dart';
import 'package:filmex/filmex/domain/usecase/get_filmex_recommendations_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_filmex_detail_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_popular_filmex_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_top_rated_filmex_usecase.dart';

abstract class BaseFilmexRepository{
  Future<Either<Failure,List<Filmex>>> getNowPlayingFilmex();

  Future<Either<Failure,List<Filmex>>> getPopularFilmex(PopularParameters parameters);


  Future<Either<Failure,List<Filmex>>> getTopRatedFilmex(TopRatedParameters parameters);

  Future<Either<Failure,FilmexDetail>> getFilmexDetail(FilmexDetailsParameters parameters);

  Future<Either<Failure,List<Recommendations>>> getRecommendations(RecommendationsParameters parameters);

}