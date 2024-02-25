part of 'details_bloc.dart';

 class DetailsState extends Equatable {
    final FilmexDetail? filmexDetail;
    final RequestState filmexDetailState;
    final String filmexDetailMessage;


    final List<Recommendations>  filmexRecommendations;
    final RequestState filmexRecommendationsState;
    final String filmexRecommendationsMessage;


  const DetailsState({ this.filmexDetail,this.filmexDetailState=RequestState.loading,this.filmexDetailMessage='',
    this.filmexRecommendations=const[],this.filmexRecommendationsState=RequestState.loading,this.filmexRecommendationsMessage='',
  });

    DetailsState copyWith({
       FilmexDetail? filmexDetail,
       RequestState? filmexDetailState,
       String? filmexDetailMessage,

       List<Recommendations>?  filmexRecommendations,
       RequestState? filmexRecommendationsState,
       String? filmexRecommendationsMessage,
 }){
      return DetailsState(
        filmexDetail: filmexDetail ?? this.filmexDetail,
          filmexDetailState: filmexDetailState ?? this.filmexDetailState,
        filmexDetailMessage: filmexDetailMessage ?? this.filmexDetailMessage,
      filmexRecommendations: filmexRecommendations??this.filmexRecommendations,
          filmexRecommendationsState: filmexRecommendationsState?? this.filmexRecommendationsState,
          filmexRecommendationsMessage: filmexRecommendationsMessage??this.filmexRecommendationsMessage

      );
    }


    @override
  List<Object?> get props => [filmexDetail, filmexDetailState, filmexDetailMessage,
      filmexRecommendations,filmexRecommendationsState,filmexRecommendationsMessage,
    ];


}

