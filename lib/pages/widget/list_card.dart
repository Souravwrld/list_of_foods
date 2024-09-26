import 'package:flutter/material.dart';
import 'package:list_of_foods/Models/food_item.dart';

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;
  final String selectedCategory;

  const FoodCard(
      {super.key, required this.foodItem, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200, // Adjust the width as per your design needs
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image at the top
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                foodItem.imageUrl,
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food name
                  Text(
                    foodItem.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Rating and delivery time row
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFCD506),
                        size: 16,
                      ),
                      Text(
                        foodItem.rating,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '• ${foodItem.deliveryTime}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Cuisine and location
                  Text(
                    selectedCategory,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
