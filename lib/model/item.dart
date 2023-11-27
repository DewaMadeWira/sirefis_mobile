class Item {
  final String name; //gpu_name
  final String price; //pirce gpu
  final String id; //pirce gpu

  Item({required this.name, required this.price,required this.id});

  factory Item.fromJson(Map<String, dynamic> json) =>
      Item(name: json['gpu_name'], price: json['price'], id: json["gpu_id"]);
}
