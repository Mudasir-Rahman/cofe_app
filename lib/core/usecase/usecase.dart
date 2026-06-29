import 'package:equatable/equatable.dart';

abstract class Usecase <type, params>{
  Future<type> call(params params);
}