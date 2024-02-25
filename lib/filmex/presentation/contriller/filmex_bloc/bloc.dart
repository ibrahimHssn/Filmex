import 'dart:async';

import 'package:filmex/core/usecase/base_usecase.dart';
import 'package:filmex/core/utils/enums.dart';
import 'package:filmex/filmex/domain/usecase/get_now_playing_filmex_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_popular_filmex_usecase.dart';
import 'package:filmex/filmex/domain/usecase/get_top_rated_filmex_usecase.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class FilmexBloc extends Bloc<FilmexEvent,FilmexState>{
  GetNowPlayingFilmexUseCase getNowPlayingFilmex;
  GetPopularFilmexUseCase getPopularFilmexGetPopular;
  GetTopRatedFilmexUseCase getTopRatedFilmexUseCase;
  FilmexBloc(this.getNowPlayingFilmex,this.getPopularFilmexGetPopular,this.getTopRatedFilmexUseCase,):super(const FilmexState()){
    on<GetNowPlayingFilmexEvent>(_getNowPlayingFilmex);
    on<GetPopularFilmexEvent>(_getPopularFilmex);
    on<GetTopRatedFilmexEvent>(_getTopRatedFilmex);

  }



  FutureOr<void> _getNowPlayingFilmex(GetNowPlayingFilmexEvent event, Emitter<FilmexState> emit) async{
    final result=await getNowPlayingFilmex(const NoParameters());
    result.fold((l) => emit(state.copyWith(nowPlayingState: RequestState.error,nowPlayingMessage: l.massage)),
            (r) => emit(state.copyWith(nowPlayingFilmex: r,
            nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _getPopularFilmex(GetPopularFilmexEvent event, Emitter<FilmexState> emit) async{
    final result=await getPopularFilmexGetPopular(PopularParameters(pageNumbering: event.pageNumbering));
    result.fold((l) => emit(state.copyWith(popularState: RequestState.error,
        popularMessage: l.massage)),
            (r) => emit(state.copyWith(popularFilmex:  r,
            popularState: RequestState.loaded)));
  }


  FutureOr<void> _getTopRatedFilmex(GetTopRatedFilmexEvent event, Emitter<FilmexState> emit) async{
    final result=await getTopRatedFilmexUseCase(TopRatedParameters(pageNumbering: event.pageNumbering));
    result.fold((l) => emit(state.copyWith(topRatedState: RequestState.error,
        topRatedMessage:l.massage)),
            (r) => emit(state.copyWith(topRatedFilmex:r,
            topRatedState: RequestState.loaded)));
  }




}