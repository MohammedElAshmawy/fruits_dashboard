import 'package:e_commerce_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:e_commerce_dashboard/features/orders/presentation/views/widgets/order_item_list_view.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});

  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          AppBar(
            title: Text("Orders"),
            centerTitle: true,
          ),
          SizedBox(height: 12,),
          GestureDetector(
            onTap: (){},
            child: Row(
              children: [
                Icon(Icons.filter_list),
                SizedBox(width: 12,),
                Text("filter"),
              ],
            ),
          ),
          Expanded(child: OrderItemListView(orders: orders))
        ],
      ),
    );
  }
}
