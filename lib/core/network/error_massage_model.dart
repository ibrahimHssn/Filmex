import 'package:equatable/equatable.dart';

class ErrorMassageModel extends Equatable{
  final int statusCode;
  final bool success;
  final String statusMessage;

  const ErrorMassageModel({required this.statusCode,required this.success,required this.statusMessage});

  factory ErrorMassageModel.fromJson(Map<String, dynamic>json)=>
      ErrorMassageModel(statusCode:json['status_code'],
          success: json['success'],
          statusMessage: json['status_message']);


  @override
  List<Object?> get props => [statusCode,success,statusMessage];
}