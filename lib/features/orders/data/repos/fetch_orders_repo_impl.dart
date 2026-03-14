import 'package:dartz/dartz.dart';
import 'package:e_commerce_dashboard/core/errors/failures.dart';
import 'package:e_commerce_dashboard/core/services/database_service.dart';
import 'package:e_commerce_dashboard/features/orders/data/models/order_model.dart';
import 'package:e_commerce_dashboard/features/orders/domain/entities/order_entity.dart';
import '../../domain/repo/fetch_orders_repo.dart';

class FetchOrdersRepoImpl implements FetchOrdersRepo {
  final DatabaseService databaseService;
  FetchOrdersRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      var data = await databaseService.getData(path: 'Orders');
      List<OrderEntity> orders =
          data.map((e) => OrderModel.fromJson(e)).toList();
      return right(orders);
    } catch (e, stackTrace) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
