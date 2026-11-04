
import 'package:cofe_app/features/product/domain/product_entity/product_entity.dart';
import 'package:cofe_app/features/product/domain/product_repositorires/product_repository.dart';

import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    return await remoteDataSource.getProducts();
  }
}
