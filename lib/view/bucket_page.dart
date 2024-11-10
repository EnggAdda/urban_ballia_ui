import 'package:flutter/material.dart';

import '../models/service.dart';
import 'order_page.dart';

class BucketPage extends StatelessWidget {
  final List<Service> bucket;

  BucketPage({required this.bucket, required List bucketItems});

  @override
  Widget build(BuildContext context) {
    double totalPrice = bucket.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(title: Text("Bucket")),
      body: bucket.isEmpty
          ? Center(child: Text("Your bucket is empty"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: bucket.length,
              itemBuilder: (context, index) {
                final service = bucket[index];
                return ListTile(
                  title: Text(service.title),
                  subtitle: Text(service.description),
                  trailing: Text("\$${service.price.toStringAsFixed(2)}"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Total: \$${totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(bucket: bucket, bucketItems: [], totalAmount: 0.0,),
                      ),
                    );
                  },
                  child: Text("Proceed to Order"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
