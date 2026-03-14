import 'package:e_commerce_dashboard/features/orders/domain/entities/order_product_entity.dart';

class OrderProductModel extends OrderProductEntity {
  OrderProductModel({
    required super.name,
    required super.code,
    required super.imageUrl,
    required super.price,
    required super.quantity,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'],
      code: json['code'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}