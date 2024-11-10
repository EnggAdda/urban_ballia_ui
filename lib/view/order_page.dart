import 'package:flutter/material.dart';
import 'package:http/src/response.dart';
import 'package:urban_ballia_ui/models/service.dart';

import '../client/api_client.dart';
import '../models/order_item.dart';
import '../models/order_request.dart';
 // Your API client

class OrderPage extends StatefulWidget {
  final List<OrderItem> bucketItems; // Items added to the bucket
  final double totalAmount; // Calculated total price

  OrderPage({required this.bucketItems, required this.totalAmount, required List<Service> bucket});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  String paymentMode = 'COD'; // Default payment mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Place Order")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: _phoneController, decoration: InputDecoration(labelText: "Phone Number")),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: _addressController, decoration: InputDecoration(labelText: "Address")),
            DropdownButton<String>(
              value: paymentMode,
              items: ['COD', 'UPI'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  paymentMode = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _placeOrder,
              child: Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }

  void _placeOrder() async {
    // Construct the order request from input fields and bucket items
    final orderRequest = OrderRequest(
      name: _nameController.text,
      phoneNumber: _phoneController.text,
      email: _emailController.text,
      address: _addressController.text,
      totalAmount: widget.totalAmount,
      paymentMode: paymentMode,
      items: widget.bucketItems,
    );

    // Make API call to place order
    final response = await ApiClient().placeOrder(orderRequest);
    if (response.isSuccess == true) {
      Navigator.pushNamed(context, '/success'); // Navigate to success page on success
    } else {
      // Handle error (e.g., show a Snackbar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to place order")),
      );
    }
  }
}

extension on Response {
  bool get isSuccess => true;
}

