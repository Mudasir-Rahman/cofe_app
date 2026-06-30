import 'package:dartz/dartz.dart';


import '../ error/failure.dart';

abstract class UseCase <type, Params>{
Future<Either<Failure, type>> call(Params params);
}
class NoParams{
  NoParams();
}