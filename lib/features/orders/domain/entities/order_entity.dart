import 'package:e_commerce_dashboard/features/orders/domain/entities/shipping_address_entity.dart';
import 'order_product_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final String orderId;

  OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressEntity,
    required this.orderProducts,
    required this.paymentMethod,
    required this.orderId,
  });


}