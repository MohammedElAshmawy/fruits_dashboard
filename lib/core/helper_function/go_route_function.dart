import 'package:e_commerce_dashboard/features/add_product/presentation/add_product_view.dart';
import 'package:e_commerce_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){

  switch(settings.name){
    case DashboardView.routName:
      return MaterialPageRoute(builder: (context)=> const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context)=> const AddProductView());
    default:
      return MaterialPageRoute(builder: (context)=> const Scaffold());
  }
}