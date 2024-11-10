class Order {
  final List<int> serviceIds; // List of service IDs
  final String address1;
  final String address2;
  final String pinCode;
  final String contactNumber;
  final String paymentMethod;

  Order({
    required this.serviceIds,
    required this.address1,
    required this.address2,
    required this.pinCode,
    required this.contactNumber,
    required this.paymentMethod,
  });
}
