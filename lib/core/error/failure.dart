import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final String massage;

  const Failure(this.massage);

  @override
  List<Object?> get props => [massage];

}


class ServerFailure extends Failure{
  const ServerFailure(super.massage);

}

class DatabaseFailure extends Failure{
  const DatabaseFailure(super.massage);
}