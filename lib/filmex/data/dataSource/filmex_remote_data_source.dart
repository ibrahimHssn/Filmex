
import 'package:dio/dio.dart';
import 'package:filmex/core/error/exceptions.dart';
import 'package:filmex/core/network/api_constance.dart';
import 'package:filmex/core/network/error_massage_model.dart';
import 'package:filmex/filmex/data/models/filmex_details_model.dart';
import 'package:filmex/filmex/data/models/filmex_model.dart';
import 'package:filmex/filmex/data/models/recommendations_model.dart';
import 'package:filmex/filmex/domain/usecase/get_filmex_recommendations_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_filmex_detail_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_popular_filmex_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_top_rated_filmex_usecase.dart';

abstract class BaseFilmexRemoteDataSource{
  Future<List<FilmexModel>> getNowPlayingFilmex();
  
  Future<List<FilmexModel>> getPopularFilmex(PopularParameters parameters);

  Future<List<FilmexModel>> getTopRatedFilmex(TopRatedParameters parameters);

  Future<FilmexDetailsModel> getFilmexDetails(FilmexDetailsParameters parameters);

  Future<List<RecommendationsModel>> getRecommendations(RecommendationsParameters parameters);

}


class FilmexRemoteDataSource extends BaseFilmexRemoteDataSource{
  @override
  
 Future<List<FilmexModel>> getNowPlayingFilmex()async{
   final response= await Dio().get(ApiConstance.nowPlayingFilmexPath,
       options: Options(headers: ApiConstance.headers,));
   if(response.statusCode==200){
     return List<FilmexModel>.from((response.data['results'] as List).map((e) => FilmexModel.fromJSON(e)));
   }else{
     throw  ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
   }
  }

  @override
  Future<List<FilmexModel>> getPopularFilmex(PopularParameters parameters) async{
   final response = await Dio().get(ApiConstance.popularFilmexPathAll(parameters.pageNumbering),
       options: Options(headers: ApiConstance.headers,));
   if(response.statusCode ==200){

     return List<FilmexModel>.from((response.data['results'] as List).map((e) =>FilmexModel.fromJSON(e)));
   }else{
     throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
   }
  }


  @override
  Future<List<FilmexModel>> getTopRatedFilmex(TopRatedParameters parameters) async{
    final response = await Dio().get(ApiConstance.topRatedPathAll(parameters.pageNumbering),options: Options(headers: ApiConstance.headers,));
    if(response.statusCode==200){
      return List<FilmexModel>.from((response.data['results'] as List).map((e) =>FilmexModel.fromJSON(e)));

    }
    else{
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));

    }

  }

  @override
  Future<FilmexDetailsModel> getFilmexDetails(FilmexDetailsParameters parameters) async{
      final response= await  Dio().get(ApiConstance.filmexDetailsPath(parameters.filmexId),options: Options(headers: ApiConstance.headers,));
      if(response.statusCode==200){
        return FilmexDetailsModel.fromJSON(response.data);
      }else{
        throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
      }
  }


  @override
  Future<List<RecommendationsModel>> getRecommendations(RecommendationsParameters parameters) async{
    final response = await Dio().get(ApiConstance.recommendationsPath(parameters.recommendationsId),options: Options(headers: ApiConstance.headers,));
    if(response.statusCode==200){
      return List<RecommendationsModel>.from((response.data['results'] as List).map((e) =>RecommendationsModel.fromJSON(e)));

    }
    else{
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));

    }

  }





}