import '../../features/orders/data/models/order_model.dart';
import '../../features/orders/data/models/order_product_model.dart';
import '../../features/orders/data/models/shipping_address_model.dart';

final testOrder = OrderModel(
  orderId: 'ORD-20481',
  totalPrice: 149.97,
  uId: 'user_abc123',
  paymentMethod: 'Credit Card',
  shippingAddressModel: ShippingAddressModel(
    name: 'Ahmed Hassan',
    phone: '+20 100 234 5678',
    email: 'ahmed.hassan@email.com',
    address: '42 Tahrir Square, Apt 3B',
    city: 'Cairo',
    floor: '3',
  ),
  orderProducts: [
    OrderProductModel(
      name: 'Wireless Noise-Cancelling Headphones',
      code: 'SKU-WNC-001',
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=200',
      price: 89.99,
      quantity: 1,
    ),
    OrderProductModel(
      name: 'Mechanical Keyboard TKL',
      code: 'SKU-MKB-047',
      imageUrl: 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=200',
      price: 49.99,
      quantity: 2,
    ),
    OrderProductModel(
      name: 'USB-C Hub 7-in-1',
      code: 'SKU-USB-112',
      imageUrl: 'https://images.unsplash.com/photo-1625948515291-69613efd103f?w=200',
      price: 9.99,
      quantity: 1,
    ),
  ],
);