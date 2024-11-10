class OrderItem {
  final int serviceId;
  final String serviceTitle;
  final double price;

  OrderItem({
    required this.serviceId,
    required this.serviceTitle,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
    'serviceId': serviceId,
    'serviceTitle': serviceTitle,
    'price': price,
  };
}