class Booking {
  final int userId;
  final int serviceId;
  final String address;
  final String paymentMode;

  Booking({required this.userId, required this.serviceId, required this.address, required this.paymentMode});

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'serviceId': serviceId,
      'address': address,
      'paymentMode': paymentMode,
    };
  }
}
