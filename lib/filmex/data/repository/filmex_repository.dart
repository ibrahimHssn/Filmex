import 'package:dartz/dartz.dart';
import 'package:filmex/core/error/exceptions.dart';
import 'package:filmex/core/error/failure.dart';
import 'package:filmex/filmex/data/dataSource/filmex_remote_data_source.dart';
import 'package:filmex/filmex/data/models/filmex_details_model.dart';
import 'package:filmex/filmex/data/models/recommendations_model.dart';
import 'package:filmex/filmex/domain/entities/filmex.dart';
import 'package:filmex/filmex/domain/repositort/base_filmex_repository.dart';
import 'package:filmex/filmex/domain/usecase/get_filmex_recommendations_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_filmex_detail_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_popular_filmex_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_top_rated_filmex_usecase.dart';

class FilmexRepository extends BaseFilmexRepository{
  final BaseFilmexRemoteDataSource baseFilmexRepository;

  FilmexRepository(this.baseFilmexRepository);

  @override
  Future<Either<Failure,List<Filmex>>> getNowPlayingFilmex() async{
    final result=await baseFilmexRepository.getNowPlayingFilmex();
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Filmex>>> getPopularFilmex(PopularParameters parameters) async{
    final  result=await baseFilmexRepository.getPopularFilmex(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Filmex>>> getTopRatedFilmex(TopRatedParameters parameters) async{
   final result= await baseFilmexRepository.getTopRatedFilmex(parameters);
   try{
     return Right(result);

   }
   on ServerException catch(failure){
     return left(ServerFailure(failure.errorMassageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, FilmexDetailsModel>> getFilmexDetail(FilmexDetailsParameters parameters) async{
    final result= await baseFilmexRepository.getFilmexDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationsModel>>> getRecommendations(RecommendationsParameters parameters)async {
    final result=await baseFilmexRepository.getRecommendations(parameters);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }


}