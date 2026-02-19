import 'package:dartz/dartz.dart';
import 'package:e_commerce_dashboard/core/errors/failures.dart';
import 'package:e_commerce_dashboard/features/add_product/domain/entities/product_entities.dart';

abstract class ProductsRepo{

  Future<Either<Failure,void>> addProducts (ProductEntities addProductEntities);

}