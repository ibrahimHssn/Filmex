import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmex/core/error/failure.dart';
import 'package:filmex/core/usecase/base_usecase.dart';
import 'package:filmex/filmex/domain/entities/filmex_detail.dart';
import 'package:filmex/filmex/domain/repositort/base_filmex_repository.dart';

class GetFilmexDetailUseCase extends BaseUseCase<FilmexDetail,FilmexDetailsParameters>{
  final BaseFilmexRepository baseFilmexRepository;

  GetFilmexDetailUseCase(this.baseFilmexRepository);

  @override
  Future<Either<Failure, FilmexDetail>> call(FilmexDetailsParameters parameters) async{
    return await baseFilmexRepository.getFilmexDetail(parameters);
  }

}

class FilmexDetailsParameters extends Equatable{
  final int filmexId;

  const FilmexDetailsParameters({required this.filmexId});

  @override
  List<Object?> get props => [filmexId];
}