import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repo/fetch_orders_repo.dart';
import 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.fetchOrdersRepo) : super(FetchOrdersInitial());

  final OrdersRepo fetchOrdersRepo;
  StreamSubscription? fetchOrdersSubscription;

  void fetchOrders() async {
    emit(FetchOrdersLoadingState());
    fetchOrdersSubscription = fetchOrdersRepo.fetchOrders().listen((result) {
      result.fold(
        (failure) {
          emit(FetchOrdersErrorState(errMessage: failure.message));
        },
        (orders) {
          emit(FetchOrdersSuccessState(orders: orders));
          },
      );
    });
  }

  @override
  Future<void> close() {
    fetchOrdersSubscription!.cancel();
    return super.close();
  }
}
