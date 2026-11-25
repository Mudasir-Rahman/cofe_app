import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/features/favorites/order/domain/entity/order_entity.dart';
import 'package:cofe_app/features/favorites/order/domain/entity/order_item_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepository {
  Future<Either<Failure, OrderEntity>> getOrderById(String OrderId);
  Future<Either<Failure, OrderEntity>> createOrder({
    required List<OrderItemEntity> items,
  });

  Future<Either<Failure, OrderEntity>> cancelOrder(String orderId);
}
