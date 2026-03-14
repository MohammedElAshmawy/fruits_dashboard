import 'package:dartz/dartz.dart';
import 'package:e_commerce_dashboard/features/orders/domain/entities/order_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class FetchOrdersRepo {
  Future <Either<Failure, List<OrderEntity>>> fetchOrders();
}