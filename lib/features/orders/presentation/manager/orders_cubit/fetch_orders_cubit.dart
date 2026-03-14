import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repo/fetch_orders_repo.dart';
import 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.fetchOrdersRepo) : super(FetchOrdersInitial());
  
  final FetchOrdersRepo fetchOrdersRepo;
  
    Future<void> fetchOrders() async {
    emit(FetchOrdersLoadingState());
    final result = await fetchOrdersRepo.fetchOrders();
    result.fold(
        (failure) => emit(FetchOrdersErrorState(errMessage: failure.message)),
      (orders) => emit(FetchOrdersSuccessState(orders: orders)),
    );
  }
}
