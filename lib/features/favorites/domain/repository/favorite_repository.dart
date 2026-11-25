import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/features/favorites/domain/entity/favorite_entity.dart';
import 'package:dartz/dartz.dart';

abstract class Fovertrepository {
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites();
  Future<Either<Failure, bool>> toggleFavorite(String productId);
}
