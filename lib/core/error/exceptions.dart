
import 'package:filmex/core/network/error_massage_model.dart';

class ServerException implements Exception{
  final ErrorMassageModel errorMassageModel;

  ServerException({required this.errorMassageModel});


}

class LocalDatabaseException implements Exception{
  final String massage;

  LocalDatabaseException({required this.massage});


}