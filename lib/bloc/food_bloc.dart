import 'package:bloc/bloc.dart';
import 'package:list_of_foods/Models/food_item.dart';
import 'package:list_of_foods/remote_data_source/food_data_source.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodDataSource foodDataSource;
  int currentPage = 0;
  bool hasMore = true;
  String selectedCategory = '';

  FoodBloc(
    this.foodDataSource,
  ) : super(FoodInitial()) {
    on<FetchFoodList>((event, emit) async {
      if (event.isLoadMore && !hasMore) return;

      try {
        if (event.isLoadMore) {
          currentPage++;
        } else {
          currentPage = 0; // Reset for fresh data
          emit(FoodLoading());
        }

        final List<FoodItem> foodItems = await foodDataSource.fetchFoodItems(
            page: currentPage, category: event.category);
        hasMore =
            foodItems.length == 20; // Assume the API returns 20 items per page

        final currentState = state;

        if (currentState is FoodLoaded && event.isLoadMore) {
          // Append new food items to the list if it's a load more event
          final updatedFoodItems = List.of(currentState.foodItems)
            ..addAll(foodItems);
          emit(FoodLoaded(foodItems: updatedFoodItems, hasMore: hasMore));
        } else {
          emit(FoodLoaded(foodItems: foodItems, hasMore: hasMore));
        }
      } catch (e) {
        emit(FoodError('Error occurred: $e'));
      }
    });

    on<SelectCategory>((event, emit) {
      selectedCategory = event.category;
      add(FetchFoodList(
          category: selectedCategory)); // Fetch food based on selected category
    });
  }
}
