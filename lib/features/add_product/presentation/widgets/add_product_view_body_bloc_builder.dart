import 'dart:math';

import 'package:e_commerce_dashboard/core/widgets/show_custom_dialog.dart';
import 'package:e_commerce_dashboard/features/add_product/presentation/manger/add_product_cubit.dart';
import 'package:e_commerce_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoadingState,
          child: AddProductViewBody(),
        );
      },
      listener: (context, state) {
        if (state is AddProductSuccessState) {
          ShowDialog(context,"تم التسجيل بنجاح");
        }
        if (state is AddProductErrorState) {
          ShowDialog(context,"لقد حدث خطأ ما ");
          print(state.message);
        }
      },
    );
  }
}
