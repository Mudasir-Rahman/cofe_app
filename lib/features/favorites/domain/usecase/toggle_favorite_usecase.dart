import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/favorites/domain/repository/favorite_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ToggleFavoriteParams extends Equatable {
  final String productId;
  ToggleFavoriteParams({required this.productId});
  @override
  List<Object?> get props => [productId];
}

class ToggleFavoriteUsecase implements UseCase<bool, ToggleFavoriteParams> {
  final Fovertrepository repository;
  ToggleFavoriteUsecase(this.repository);
  @override
  Future<Either<Failure, bool>> call(ToggleFavoriteParams params) {
    return repository.toggleFavorite(params.productId);
  }
}
