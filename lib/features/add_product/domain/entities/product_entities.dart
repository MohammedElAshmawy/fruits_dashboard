import 'dart:io';

class ProductEntities {
  final String name;
  final num price;
  final String code;
  final String desc;
  final File image;
  final bool isFeatured;
  String? imageUrl;

   ProductEntities({
    required this.name,
    required this.price,
    required this.code,
    required this.desc,
    required this.image,
    this.imageUrl,
    required this.isFeatured,
  });

}
