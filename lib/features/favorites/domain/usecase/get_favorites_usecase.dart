import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/favorites/domain/entity/favorite_entity.dart';
import 'package:cofe_app/features/favorites/domain/repository/favorite_repository.dart';
import 'package:dartz/dartz.dart';

class GetFavoritesUsecase implements UseCase<List<FavoriteEntity>, NoParams> {
  final Fovertrepository repository;
  GetFavoritesUsecase(this.repository);

  Future<Either<Failure, List<FavoriteEntity>>> call(NoParams params) {
    return repository.getFavorites();
  }
}
