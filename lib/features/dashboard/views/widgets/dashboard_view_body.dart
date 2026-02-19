import 'package:e_commerce_dashboard/features/add_product/presentation/add_product_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onPressed: (){
                  Navigator.pushNamed(context, AddProductView.routeName);
                },
                text: "Add Data"),
          ],
        ),
      ),
    );
  }
}
