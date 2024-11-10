import 'package:flutter/material.dart';
import 'package:urban_ballia_ui/view/bucket_page.dart';
import 'package:urban_ballia_ui/view/home_page.dart';
import 'package:urban_ballia_ui/view/order_page.dart';
import 'package:urban_ballia_ui/view/service_list.dart';
import 'package:urban_ballia_ui/view/success_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urban Services',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(), // Pass real data here
        '/bucket': (context) => BucketPage(bucketItems: const [], bucket: [],),
        '/order': (context) => OrderPage(bucketItems: [], bucket: [], totalAmount:0.0,),
        '/success': (context) => SuccessPage(),
      },
    );
  }
}