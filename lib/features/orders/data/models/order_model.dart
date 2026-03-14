import 'package:e_commerce_dashboard/features/orders/data/models/shipping_address_model.dart';
import '../../domain/entities/order_entity.dart';
import 'order_product_model.dart';

class OrderModel extends OrderEntity {

  OrderModel({
    required super.totalPrice,
    required super.uId,
    required ShippingAddressModel shippingAddressModel,
    required List<OrderProductModel> orderProducts,
    required super.paymentMethod,
    required super.orderId,
  }) : super(
    shippingAddressEntity: shippingAddressModel,
    orderProducts: orderProducts,
  );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: (json['totalPrice'] as num).toDouble(),
      uId: json['uId'],
      shippingAddressModel:
      ShippingAddressModel.fromJson(json['shippingAddressModel']),
      orderProducts: (json['orderProducts'] as List)
          .map((e) => OrderProductModel.fromJson(e))
          .toList(),
      paymentMethod: json['paymentMethod'],
      orderId: json['orderId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'uId': uId,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'shippingAddressModel':
      (shippingAddressEntity as ShippingAddressModel).toJson(),
      'orderProducts':
      orderProducts.map((e) => (e as OrderProductModel).toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}