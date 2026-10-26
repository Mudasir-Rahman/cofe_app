class ProductEntity {
  final String id;
  final String name;
  final String? description;
  final double price;
  final String? imageUrl;
  final String? category;
  final bool isAvailable;

  const ProductEntity({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.imageUrl,
    this.category,
    required this.isAvailable,
  });
}
