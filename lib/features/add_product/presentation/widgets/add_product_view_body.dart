import 'dart:io';
import 'package:e_commerce_dashboard/core/widgets/custom_button.dart';
import 'package:e_commerce_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_dashboard/core/widgets/featured_check_box.dart';
import 'package:e_commerce_dashboard/features/add_product/domain/entities/product_entities.dart';
import 'package:e_commerce_dashboard/features/add_product/presentation/manger/add_product_cubit.dart';
import 'package:e_commerce_dashboard/features/add_product/presentation/widgets/image_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String name, code, desc;
  late num price;
  late bool isFeatured = false;
  late File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 18),
                  CustomTextFormField(
                    onSaved: (value) {
                      name = value!;
                    },
                    hintText: "product name",
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 12),
                  CustomTextFormField(
                    onSaved: (value) {
                      price = num.parse(value!);
                    },
                    hintText: "product price",
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 12),
                  CustomTextFormField(
                    onSaved: (value) {
                      code = value!.toLowerCase();
                    },
                    hintText: "product code",
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 12),
                  CustomTextFormField(
                    onSaved: (value) {
                      desc = value!;
                    },
                    hintText: "product description",
                    textInputType: TextInputType.text,
                    maxLines: 4,
                  ),
                  SizedBox(height: 24),
                  FeaturedCheckBox(
                    onChanged: (value) {
                      isFeatured = value;
                    },
                  ),
                  SizedBox(height: 12),
                  ImageField(
                    onFileChanged: (image) {
                      this.image = image;
                    },
                  ),
                  SizedBox(height: 18),
                  CustomButton(
                    onPressed: () {
                      if (image != null) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          ProductEntities input = ProductEntities(
                            name: name,
                            price: price,
                            code: code,
                            desc: desc,
                            image: image!,
                            isFeatured: isFeatured,
                          );
                          context.read<AddProductCubit>().addProduct(input);
                        } else {}
                      } else {
                        showAboutDialog(
                          applicationIcon: Center(
                            child: Icon(Icons.warning_amber_outlined),
                          ),
                          children: [Text("the image is required ")],
                          context: context,
                        );
                      }
                    },
                    text: "Add",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
