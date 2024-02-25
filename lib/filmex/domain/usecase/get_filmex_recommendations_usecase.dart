import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmex/core/error/failure.dart';
import 'package:filmex/core/usecase/base_usecase.dart';
import 'package:filmex/filmex/domain/entities/recommendations.dart';
import 'package:filmex/filmex/domain/repositort/base_filmex_repository.dart';

class GetFilmexRecommendationsUseCase extends BaseUseCase<List<Recommendations>,RecommendationsParameters>{
final BaseFilmexRepository baseFilmexRepository;

  GetFilmexRecommendationsUseCase(this.baseFilmexRepository);

  @override
  Future<Either<Failure, List<Recommendations>>> call(RecommendationsParameters parameters) async {
    return await baseFilmexRepository.getRecommendations(parameters);
  }

}




class RecommendationsParameters extends Equatable{
  final int recommendationsId;

  const RecommendationsParameters({required this.recommendationsId,});

  @override
  List<Object?> get props => [recommendationsId];
}