import 'package:e_commerce_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel extends ShippingAddressEntity {

  ShippingAddressModel({
    required super.name,
    required super.phone,
    required super.address,
    required super.city,
    required super.email,
    required super.floor,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      email: json['email'],
      floor: json['floor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'city': city,
      'email': email,
      'floor': floor,
    };
  }
}
