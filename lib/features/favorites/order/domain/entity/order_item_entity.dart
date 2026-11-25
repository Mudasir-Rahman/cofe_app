import 'package:equatable/equatable.dart';

class OrderItemEntity extends Equatable {
  final String id;
  final String orderId;
  final String? productId; // Nullable because SQL uses ON DELETE SET NULL
  final String productName;
  final String? productImageUrl;
  final int quantity;
  final double unitPrice;

  const OrderItemEntity({
    required this.id,
    required this.orderId,
    this.productId,
    required this.productName,
    this.productImageUrl,
    required this.quantity,
    required this.unitPrice,
  });

  double get subtotal => unitPrice * quantity;

  @override
  List<Object?> get props => [
    id,
    orderId,
    productId,
    productName,
    productImageUrl,
    quantity,
    unitPrice,
  ];
}
