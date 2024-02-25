
import 'package:equatable/equatable.dart';

abstract class FilmexEvent extends Equatable{

  const FilmexEvent();

}

class GetNowPlayingFilmexEvent extends FilmexEvent{
  @override
  List<Object> get props=>[];
}

class GetPopularFilmexEvent extends FilmexEvent{
  final int pageNumbering;

  const GetPopularFilmexEvent({required this.pageNumbering});
  @override
  List<Object> get props=>[];


}
class GetTopRatedFilmexEvent extends FilmexEvent{
  final int pageNumbering;

  const GetTopRatedFilmexEvent({required this.pageNumbering});

  @override
  List<Object> get props=>[];


}
