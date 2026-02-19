import 'dart:io';

import 'package:e_commerce_dashboard/features/add_product/domain/entities/product_entities.dart';

class ProductsModel{
  final String name;
  final num price;
  final String code;
  final String desc;
  final File image;
  final bool isFeatured;
  String? imageUrl;

  ProductsModel({
    required this.name,
    required this.price,
    required this.code,
    required this.desc,
    required this.image,
    this.imageUrl,
    required this.isFeatured
  });

  factory ProductsModel.fromEntity(ProductEntities addProductEntities){
    return ProductsModel(
        name: addProductEntities.name,
        price: addProductEntities.price,
        code: addProductEntities.code,
        desc: addProductEntities.desc,
        image: addProductEntities.image,
        imageUrl: addProductEntities.imageUrl,
        isFeatured: addProductEntities.isFeatured
    );
  }

  toJson(){
    return{
      'name': name,
      'code': code,
      'description': desc,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
    };
  }

}