import 'package:filmex/core/network/api_constance.dart';
import 'package:filmex/filmex/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations{
  const RecommendationsModel({ super.backdropPath, required super.id});
 factory RecommendationsModel.fromJSON(Map<String,dynamic>json)=>RecommendationsModel(
     id: json['id'],
   backdropPath: json['backdrop_path']?? ApiConstance.imageEmpty_,
 );

}