import 'package:e_commerce_dashboard/features/orders/presentation/manager/update_order/update_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/status_enum.dart';
import '../../../domain/repo/fetch_orders_repo.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.ordersRepo) : super(UpdateOrderInitial());

  final OrdersRepo ordersRepo;

  Future<void> updateOrderStatus({
    required String orderId,
    required OrderStatus status}) async {
    emit(UpdateOrderLoading());
    final result = await ordersRepo.updateOrderStatus(
      orderId: orderId,
      status: status,
    );
    result.fold(
      (failure) => emit(UpdateOrderError(message: failure.message)),
      (r) => emit(UpdateOrderSuccess()),
    );
  }
}
