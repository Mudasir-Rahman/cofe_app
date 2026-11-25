import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final String userId;
  final String productId;
  final DateTime createdAt;

  const FavoriteEntity({
    required this.userId,
    required this.productId,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [userId, productId, createdAt];
}
