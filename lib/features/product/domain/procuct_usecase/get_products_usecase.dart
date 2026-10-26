import 'package:cofe_app/features/product/domain/product_entity/product_entity.dart';
import 'package:cofe_app/features/product/domain/product_repositorires/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.getProducts();
  }
}
