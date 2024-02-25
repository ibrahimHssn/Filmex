import 'package:equatable/equatable.dart';
import 'package:filmex/core/utils/enums.dart';
import 'package:filmex/filmex/domain/entities/filmex.dart';

class FilmexState extends Equatable {
  final List<Filmex> nowPlayingFilmex;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Filmex> popularFilmex;
  final RequestState  popularState;
  final String  popularMessage;


  final List<Filmex>  topRatedFilmex;
  final RequestState   topRatedState;
  final String   topRatedMessage;

  const FilmexState( {
    this.nowPlayingFilmex=const [], this.nowPlayingState=RequestState.loading,  this.nowPlayingMessage='',
    this. popularFilmex=const [], this. popularState=RequestState.loading,  this.popularMessage='',
    this.topRatedFilmex=const [], this.topRatedState=RequestState.loading,  this. topRatedMessage='',


  });
  FilmexState copyWith({
    List<Filmex>? nowPlayingFilmex,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,

    List<Filmex>? popularFilmex,
    RequestState?  popularState,
    String?  popularMessage,



    List<Filmex>? topRatedFilmex,
    RequestState?   topRatedState,
    String?   topRatedMessage,

  }){
    return FilmexState(
      nowPlayingFilmex: nowPlayingFilmex?? this.nowPlayingFilmex,
      nowPlayingState: nowPlayingState?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage??this.nowPlayingMessage,

      popularFilmex: popularFilmex??this.popularFilmex,
      popularState: popularState??this.popularState,
      popularMessage: popularMessage??this.popularMessage,


      topRatedFilmex:  topRatedFilmex??this.topRatedFilmex,
      topRatedState:  topRatedState??this.topRatedState,
      topRatedMessage:  topRatedMessage??this.topRatedMessage,
    );
  }

  @override
  List<Object> get props=>[
    nowPlayingFilmex,nowPlayingState,nowPlayingMessage,
    popularFilmex, popularState, popularMessage,
    topRatedFilmex,  topRatedState,  topRatedMessage,
  ];


}