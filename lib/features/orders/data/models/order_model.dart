import 'package:e_commerce_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:e_commerce_dashboard/features/orders/data/models/status_enum.dart';
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
    required super.status,
  }) : super(
    shippingAddressEntity: shippingAddressModel,
    orderProducts: orderProducts,
  );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: OrderStatus.values.firstWhere(
            (e) => e.name == json['status'],
      ),
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
      'status': fetchEnum(),
      'date': DateTime.now().toString(),
      'shippingAddressModel':
      (shippingAddressEntity as ShippingAddressModel).toJson(),
      'orderProducts':
      orderProducts.map((e) => (e as OrderProductModel).toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

  OrderStatus fetchEnum() {
    return OrderStatus.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}
