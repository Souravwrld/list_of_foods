class FoodItem {
  final String title;
  final String imageUrl;
  final String rating;
  final String deliveryTime;

  FoodItem({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTime,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      title: json['title'],
      imageUrl: json['image'],
      rating: (json['spoonacularScore'] ?? 4.0).toString(),
      deliveryTime: '45-50 mins',
    );
  }
}
