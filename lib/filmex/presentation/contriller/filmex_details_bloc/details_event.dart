part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
}

class GetFilmexDetailsEvent extends DetailsEvent{
  final int id;

  const GetFilmexDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];

}

class GetFilmexRecommendationEvent extends DetailsEvent{
  final int id;

  const GetFilmexRecommendationEvent(this.id);

  @override
  List<Object?> get props => [id];



}