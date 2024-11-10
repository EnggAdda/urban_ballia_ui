

import 'package:flutter/material.dart';

import '../client/api_client.dart';
import '../models/service.dart';


class ServiceListPage extends StatefulWidget {
  @override
  _ServiceListPageState createState() => _ServiceListPageState();
}

class _ServiceListPageState extends State<ServiceListPage> {
  final ApiClient apiClient = ApiClient();
  List<Service> services = [];

  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  void fetchServices() async {
    try {
      List<Service> fetchedServices = await apiClient.fetchServices();
      setState(() {
        services = fetchedServices;
      });
    } catch (e) {
      print("Error fetching services: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Services")),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            child: ListTile(
              title: Text(service.title),
              subtitle: Text("\$${service.price.toString()}"),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Add service to bucket
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
