import 'package:e_commerce_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:e_commerce_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:e_commerce_dashboard/features/orders/domain/entities/shipping_address_entity.dart';
import '../../features/orders/data/models/status_enum.dart';

final testOrder = OrderEntity(
  orderId: 'ORD-20481',
  totalPrice: 149.97,
  uId: 'user_abc123',
  paymentMethod: 'Credit Card',
  shippingAddressEntity: ShippingAddressEntity(
    name: 'Ahmed Hassan',
    phone: '+20 100 234 5678',
    email: 'ahmed.hassan@email.com',
    address: '42 Tahrir Square, Apt 3B',
    city: 'Cairo',
    floor: '3',
  ),
  orderProducts: [
    OrderProductEntity(
      name: 'Wireless Noise-Cancelling Headphones',
      code: 'SKU-WNC-001',
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=200',
      price: 89.99,
      quantity: 1,
    ),
    OrderProductEntity(
      name: 'Mechanical Keyboard TKL',
      code: 'SKU-MKB-047',
      imageUrl: 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=200',
      price: 49.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'USB-C Hub 7-in-1',
      code: 'SKU-USB-112',
      imageUrl: 'https://images.unsplash.com/photo-1625948515291-69613efd103f?w=200',
      price: 9.99,
      quantity: 1,
    ),
  ], status: OrderStatus.pending,
);