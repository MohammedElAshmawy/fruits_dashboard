import 'package:dartz/dartz.dart';
import 'package:e_commerce_dashboard/core/errors/failures.dart';
import 'package:e_commerce_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:e_commerce_dashboard/core/services/database_service.dart';
import 'package:e_commerce_dashboard/features/add_product/data/models/product_model.dart';
import 'package:e_commerce_dashboard/features/add_product/domain/entities/product_entities.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, void>> addProducts(ProductEntities addProductEntities) async {
    try {
      await databaseService.addData(
        path: "products",
        data: ProductsModel.fromEntity(addProductEntities).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: "failed to add product"));
    }
  }
}
