import '../../../domain/entities/order_entity.dart';

abstract class FetchOrdersState {}

final class FetchOrdersInitial extends FetchOrdersState {}

final class FetchOrdersLoadingState extends FetchOrdersState {}

final class FetchOrdersErrorState extends FetchOrdersState {
  final String errMessage;

  FetchOrdersErrorState({required this.errMessage});
}

final class FetchOrdersSuccessState extends FetchOrdersState {
  final List<OrderEntity> orders;

  FetchOrdersSuccessState({required this.orders});
}
