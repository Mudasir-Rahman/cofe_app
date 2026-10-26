import 'package:cofe_app/features/product/domain/product_entity/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
}
