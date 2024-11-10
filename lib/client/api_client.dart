import 'dart:convert';

import 'package:urban_ballia_ui/models/booking.dart';

import '../models/order_request.dart';
import '../models/service.dart';
import 'package:http/http.dart' as http;


const String baseUrl = 'http://192.168.1.3:8080/api';

class ApiClient {
  // Fetch all services from the backend
  Future<List<Service>> fetchServices() async {
    final response = await http.get(Uri.parse('$baseUrl/services'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((service) => Service.fromJson(service)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }

  // Create a booking (order)
  Future<void> createBooking(Booking booking) async {
    final response = await http.post(
      Uri.parse('$baseUrl/bookings'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(booking.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create booking');
    }
  }
  Future<http.Response> placeOrder(OrderRequest orderRequest) async {
    final url = Uri.parse("$baseUrl/orders/place");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(orderRequest.toJson()),
    );
    return response;
  }
}
