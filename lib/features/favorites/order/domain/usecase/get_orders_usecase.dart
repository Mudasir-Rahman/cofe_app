import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/favorites/order/domain/entity/order_entity.dart';
import 'package:cofe_app/features/favorites/order/domain/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';

class GetOrderByIdUsecase implements UseCase<OrderEntity, String> {
  final OrderRepository orderRepository;

  const GetOrderByIdUsecase(this.orderRepository);

  @override
  Future<Either<Failure, OrderEntity>> call(String orderId) {
    return orderRepository.getOrderById(orderId);
  }
}
