import 'package:filmex/filmex/data/dataSource/filmex_remote_data_source.dart';
import 'package:filmex/filmex/data/repository/filmex_repository.dart';
import 'package:filmex/filmex/domain/repositort/base_filmex_repository.dart';
import 'package:filmex/filmex/domain/usecase/get_filmex_recommendations_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_filmex_detail_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_now_playing_filmex_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_popular_filmex_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_top_rated_filmex_usecase.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/bloc.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_details_bloc/details_bloc.dart';
import 'package:get_it/get_it.dart';
final sl = GetIt.instance;
class ServicesLocator{

  void init(){

    /// Bloc
    sl.registerFactory(() => FilmexBloc(sl(),sl(),sl(),));
    sl.registerFactory(() => DetailsBloc(sl(),sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingFilmexUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularFilmexUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedFilmexUseCase(sl()));
    sl.registerLazySingleton(() => GetFilmexDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetFilmexRecommendationsUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseFilmexRepository>(() => FilmexRepository(sl()));

    ///   Data Source
    sl.registerLazySingleton<BaseFilmexRemoteDataSource>(() => FilmexRemoteDataSource());
  }
}