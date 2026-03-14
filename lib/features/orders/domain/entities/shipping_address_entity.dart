
class ShippingAddressEntity {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;
  String? floor;

  ShippingAddressEntity({
    this.name,
    this.phone,
    this.address,
    this.city,
    this.email,
    this.floor,
  });

  factory ShippingAddressEntity.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressEntity(
      name: entity.name,
      phone: entity.phone,
      address: entity.address,
      city: entity.city,
      email: entity.email,
      floor: entity.floor,
    );
  }

}
