import 'package:dartz/dartz.dart';
import 'package:filmex/core/error/failure.dart';
import 'package:filmex/core/usecase/base_usecase.dart';
import 'package:filmex/filmex/domain/entities/filmex.dart';
import 'package:filmex/filmex/domain/repositort/base_filmex_repository.dart';

class GetNowPlayingFilmexUseCase extends BaseUseCase<List<Filmex>,NoParameters>{
  final BaseFilmexRepository baseFilmexRepository;

  GetNowPlayingFilmexUseCase(this.baseFilmexRepository);

  @override
  Future<Either<Failure,List<Filmex>>> call(NoParameters parameters) async{
    return await baseFilmexRepository.getNowPlayingFilmex();
  }
}