import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmex/core/error/failure.dart';
import 'package:filmex/core/usecase/base_usecase.dart';
import 'package:filmex/filmex/domain/entities/filmex.dart';
import 'package:filmex/filmex/domain/repositort/base_filmex_repository.dart';

class GetTopRatedFilmexUseCase extends BaseUseCase<List<Filmex>,TopRatedParameters>{
  final BaseFilmexRepository baseFilmexRepository;

  GetTopRatedFilmexUseCase(this.baseFilmexRepository);

  @override
  Future<Either<Failure,List<Filmex>>> call(TopRatedParameters parameters) async{
    return await baseFilmexRepository.getTopRatedFilmex(parameters);
  }

}
class TopRatedParameters extends Equatable{
  final int pageNumbering;

  const TopRatedParameters({required this.pageNumbering,});

  @override
  List<Object?> get props => [pageNumbering];
}