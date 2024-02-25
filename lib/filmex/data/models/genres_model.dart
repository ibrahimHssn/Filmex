import 'package:filmex/filmex/domain/entities/genres.dart';

class GenresModel extends Genres{
  const GenresModel({required super.id, required super.name});
  factory GenresModel.fromJSON(Map<String,dynamic>json)=>GenresModel(id: json['id'], name: json['name']);

}