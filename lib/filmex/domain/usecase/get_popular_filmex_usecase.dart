import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmex/core/error/failure.dart';
import 'package:filmex/core/usecase/base_usecase.dart';
import 'package:filmex/filmex/domain/entities/filmex.dart';
import 'package:filmex/filmex/domain/repositort/base_filmex_repository.dart';

class GetPopularFilmexUseCase extends BaseUseCase<List<Filmex>,PopularParameters>{
  final BaseFilmexRepository baseFilmexRepository;

  GetPopularFilmexUseCase(this.baseFilmexRepository);

  @override
  Future<Either<Failure,List<Filmex>>> call(PopularParameters parameters) async{
    return await baseFilmexRepository.getPopularFilmex(parameters);
  }
}


class PopularParameters extends Equatable{
  final int pageNumbering;

  const PopularParameters({required this.pageNumbering,});

  @override
  List<Object?> get props => [pageNumbering];
}