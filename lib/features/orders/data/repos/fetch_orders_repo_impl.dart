import 'package:dartz/dartz.dart';
import 'package:e_commerce_dashboard/core/errors/failures.dart';
import 'package:e_commerce_dashboard/core/services/database_service.dart';
import 'package:e_commerce_dashboard/features/orders/data/models/order_model.dart';
import 'package:e_commerce_dashboard/features/orders/domain/entities/order_entity.dart';
import '../../domain/repo/fetch_orders_repo.dart';
import '../models/status_enum.dart';

class FetchOrdersRepoImpl implements OrdersRepo {
  final DatabaseService _databaseService;

  FetchOrdersRepoImpl({required DatabaseService databaseService})
      : _databaseService = databaseService;

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data in _databaseService.streamData(path: 'orders')) {
        List<OrderEntity> orders =
            (data).map((e) => OrderModel.fromJson(e)).toList();
        yield right(orders);
      }
    } catch (e) {
      yield left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
  }) async {
    try {
      await _databaseService.updateData(
        path: 'orders',
        data: {'status': status.name},
        documentId: orderId,
      );
      return right(null);
    } catch (e, stackTrace) {
      print(stackTrace);
      return left(ServerFailure(message: e.toString()));
    }
  }
}
