import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/favorites/order/domain/entity/order_entity.dart';
import 'package:cofe_app/features/favorites/order/domain/entity/order_item_entity.dart';
import 'package:cofe_app/features/favorites/order/domain/repositories/order_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateOrderParams extends Equatable {
  final List<OrderItemEntity> items;

  const CreateOrderParams({required this.items});

  @override
  List<Object?> get props => [items];
}

class CreateOrderUseCase implements UseCase<OrderEntity, CreateOrderParams> {
  final OrderRepository repository;

  const CreateOrderUseCase(this.repository);

  @override
  Future<Either<Failure, OrderEntity>> call(CreateOrderParams params) async {
    if (params.items.isEmpty) {
      return const Left(
        ValidationFailure('Cannot create an order without items.'),
      );
    }
    return repository.createOrder(items: params.items);
  }
}
