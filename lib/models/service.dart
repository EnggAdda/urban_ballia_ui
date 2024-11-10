class Service {
  final int id;
  final String title;
  final String description;
  final double price;
 // final String imageUrl;

  Service({required this.id, required this.title, required this.description, required this.price});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
   //   imageUrl: json['imageUrl'],
    );
  }
}
