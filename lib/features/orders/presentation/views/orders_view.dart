import 'package:e_commerce_dashboard/core/helper_function/get_dummy.dart';
import 'package:e_commerce_dashboard/core/helper_function/service_locator.dart';
import 'package:e_commerce_dashboard/features/orders/presentation/manager/orders_cubit/fetch_orders_cubit.dart';
import 'package:e_commerce_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../domain/repo/fetch_orders_repo.dart';
import '../manager/orders_cubit/fetch_orders_state.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = "ordersView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FetchOrdersCubit(
              getIt.get<FetchOrdersRepo>())..fetchOrders(),
      child: const Scaffold(
        body: OrdersViewBodyBlocBuilder(),
      ),
    );
  }
}

class OrdersViewBodyBlocBuilder extends StatelessWidget {
  const OrdersViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccessState) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is FetchOrdersErrorState) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: OrdersViewBody(
              orders: [testOrder, testOrder, testOrder],
            ),
          );
        }
      },
    );
  }
}
