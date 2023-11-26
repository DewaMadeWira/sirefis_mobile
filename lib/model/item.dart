class Item{
  final String name;//gpu_name
  final String price;//pirce gpu
  
  Item({
    required this.name, 
    required this.price
  
  });

  factory Item.fromJson(Map<String, dynamic>json)=> Item(
    name: json['name'], 
    price: json['price']
  );
}