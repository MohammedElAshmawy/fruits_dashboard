import 'package:e_commerce_dashboard/core/helper_function/get_dummy.dart';
import 'package:e_commerce_dashboard/features/orders/presentation/views/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

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
          OrderItem(order: testOrder)

        ],
      ),
    );
  }
}
