import 'package:dartz/dartz.dart';
import 'package:e_commerce_dashboard/features/orders/domain/entities/order_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/status_enum.dart';

abstract class OrdersRepo {
  Stream <Either<Failure, List<OrderEntity>>> fetchOrders();
  Future <Either<Failure, void>> updateOrderStatus({required String orderId, required OrderStatus status});
}