import 'package:equatable/equatable.dart';
import 'order_item_entity.dart';

enum OrderStatus {
  pending,
  confirmed,
  preparing,
  ready,
  completed,
  cancelled;

  static OrderStatus fromString(String value) {
    return OrderStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => OrderStatus.pending,
    );
  }
}

class OrderEntity extends Equatable {
  final String id;
  final String userId;
  final double totalAmount;
  final OrderStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OrderItemEntity> items;

  const OrderEntity({
    required this.id,
    required this.userId,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.items = const [],
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    totalAmount,
    status,
    createdAt,
    updatedAt,
    items,
  ];
}
