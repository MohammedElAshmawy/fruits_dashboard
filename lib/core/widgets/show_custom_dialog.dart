import 'package:e_commerce_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import '../utils/text_Styles.dart';

void ShowDialog(BuildContext context,String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.network(
            //   "https://assets2.lottiefiles.com/packages/lf20_jbrw3hcz.json",
            //   width: 240,
            //   height: 120,
            // ),
            const SizedBox(height: 16),
             Text(
              message,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, DashboardView.routName);
                // يقفل الـ Dialog
              },
              child:  Text('تم',
                style: TextStyles.semiBold16,
              ),
            ),
          ],
        ),
      );
    },
  );
}
