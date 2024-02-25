import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:filmex/core/utils/enums.dart';
import 'package:filmex/filmex/domain/entities/filmex_detail.dart';
import 'package:filmex/filmex/domain/entities/recommendations.dart';
import 'package:filmex/filmex/domain/usecase/get_filmex_recommendations_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_filmex_detail_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_event.dart';

part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  GetFilmexDetailUseCase getFilmexDetailUseCase;
  GetFilmexRecommendationsUseCase getFilmexRecommendationsUseCase;

  DetailsBloc(this.getFilmexDetailUseCase,this.getFilmexRecommendationsUseCase) : super(const DetailsState()) {
    on<GetFilmexDetailsEvent>(_getFilmexDetails);
    on<GetFilmexRecommendationEvent>(_getFilmexRecommendations);
  }

  FutureOr<void> _getFilmexDetails(GetFilmexDetailsEvent event, Emitter<DetailsState> emit) async {
    final result = await getFilmexDetailUseCase(FilmexDetailsParameters(filmexId: event.id));
    result.fold((l) => emit(state.copyWith(
              filmexDetailState: RequestState.error,
              filmexDetailMessage: l.massage,
            )), (r) => emit(state.copyWith(filmexDetail: r, filmexDetailState: RequestState.loaded)));
  }


  FutureOr<void> _getFilmexRecommendations(GetFilmexRecommendationEvent event, Emitter<DetailsState> emit) async{
    final result=await getFilmexRecommendationsUseCase(RecommendationsParameters(recommendationsId: event.id));
    result.fold((l) => emit(state.copyWith(
      filmexRecommendationsState: RequestState.error,
      filmexRecommendationsMessage:l.massage,
    )), (r) => emit(state.copyWith(
      filmexRecommendations:r,
      filmexRecommendationsState: RequestState.loaded,
    )));
  }
}
