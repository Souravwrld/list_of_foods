part of 'food_bloc.dart';

@immutable
sealed class FoodState {}

final class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodLoaded extends FoodState {
  final List<FoodItem> foodItems;
  final bool hasMore;

  FoodLoaded({required this.foodItems, required this.hasMore});
}

class FoodError extends FoodState {
  final String error;

  FoodError(this.error);
}
