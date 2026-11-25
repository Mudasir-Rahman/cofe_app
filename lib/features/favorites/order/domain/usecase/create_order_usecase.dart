import 'package:cofe_app/features/favorites/order/domain/entity/order_item_entity.dart';
import 'package:equatable/equatable.dart';

class CreateOrderParams implements Equatable {
  final List<OrderItemEntity> items;
  const CreateOrderParams({required this.items});
  @override
  List<Object?> get props => [items];
}
