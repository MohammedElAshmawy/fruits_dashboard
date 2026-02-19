import 'package:e_commerce_dashboard/core/helper_function/service_locator.dart';
import 'package:e_commerce_dashboard/features/add_product/presentation/manger/add_product_cubit.dart';
import 'package:e_commerce_dashboard/features/add_product/presentation/widgets/add_product_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/repos/image_repo/image_repo.dart';
import '../../../core/repos/products_repo/products_repo.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = "addProduct";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
          getIt.get<ProductsRepo>(),
          getIt.get<ImagesRepo>()),
      child: AddProductViewBodyBlocBuilder(),
    );
  }
}