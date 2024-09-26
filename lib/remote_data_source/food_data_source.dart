import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:list_of_foods/Models/food_item.dart';

class FoodDataSource {
  final Dio _dio = Dio();

  Future<List<FoodItem>> fetchFoodItems(
      {int page = 0, String category = ''}) async {
    try {
      final response = await _dio.get(
        'https://api.spoonacular.com/recipes/complexSearch',
        queryParameters: {
          'apiKey': '0ff193f92cd243b88471b41c16bd07e0',
          'number': 20, // Number of items per page
          'offset': page * 20, // Calculate offset based on page number
          'type': category.isNotEmpty ? category : null, // Pass category type
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results.map((json) => FoodItem.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load food items');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
