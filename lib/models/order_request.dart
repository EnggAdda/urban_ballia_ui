import 'order_item.dart';

class OrderRequest {
  final String name;
  final String phoneNumber;
  final String email;
  final String address;
  final double totalAmount;
  final String paymentMode;
  final List<OrderItem> items;

  OrderRequest({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.totalAmount,
    required this.paymentMode,
    required this.items,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'phoneNumber': phoneNumber,
    'email': email,
    'address': address,
    'totalAmount': totalAmount,
    'paymentMode': paymentMode,
    'items': items.map((item) => item.toJson()).toList(),
  };
}