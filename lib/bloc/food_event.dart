part of 'food_bloc.dart';

@immutable
sealed class FoodEvent {}

class FetchFoodList extends FoodEvent {
  final bool isLoadMore;
  final String category;
  FetchFoodList({this.isLoadMore = false, this.category = ''});
}

class SelectCategory extends FoodEvent {
  final String category;

  SelectCategory(this.category);
}
