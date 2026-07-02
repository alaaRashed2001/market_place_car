class CarListing {
  const CarListing({
    required this.imageUrl,
    required this.brand,
    required this.price,
    required this.transmission,
    required this.seats,
    required this.fuelType,
  });

  final String imageUrl;
  final String brand;
  final String price;
  final String transmission;
  final int seats;
  final String fuelType;
}