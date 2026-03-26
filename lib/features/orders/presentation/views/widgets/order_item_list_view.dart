import 'package:e_commerce_dashboard/features/orders/presentation/views/widgets/order_item.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/order_entity.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.orders});

  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context,index){
          return OrderItem(orderEntity: orders[index]);
        }
    );
  }
}
