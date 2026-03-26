import 'package:e_commerce_dashboard/features/orders/data/models/status_enum.dart';
import 'package:e_commerce_dashboard/features/orders/domain/entities/shipping_address_entity.dart';
import 'order_product_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final String orderId;
  final OrderStatus? status;

  OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressEntity,
    required this.orderProducts,
    required this.paymentMethod,
    required this.orderId,
    required this.status,
  });


}