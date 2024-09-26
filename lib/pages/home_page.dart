import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_of_foods/bloc/food_bloc.dart';
import 'package:list_of_foods/pages/widget/food_category.dart';
import 'package:list_of_foods/pages/widget/list_card.dart';
import 'package:list_of_foods/remote_data_source/food_data_source.dart';

class FoodListView extends StatefulWidget {
  @override
  _FoodListViewState createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  final FoodDataSource foodRepository = FoodDataSource();
  String selectedCategory = ''; // Store selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food List'),
      ),
      body: Column(
        children: [
          // Horizontal Scrollable Categories
          SizedBox(
            height: 60.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FoodCategoryChip(
                    label: 'main course',
                    isSelected: selectedCategory == 'main course',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'main course';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('main course'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'side dish',
                    isSelected: selectedCategory == 'side dish',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'side dish';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('side dish'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'dessert',
                    isSelected: selectedCategory == 'dessert',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'dessert';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('dessert'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'salad',
                    isSelected: selectedCategory == 'salad',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'salad';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('salad'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'bread',
                    isSelected: selectedCategory == 'bread',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'bread';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('bread'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'breakfast',
                    isSelected: selectedCategory == 'breakfast',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'breakfast';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('breakfast'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'soup',
                    isSelected: selectedCategory == 'soup',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'soup';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('soup'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'beverage',
                    isSelected: selectedCategory == 'beverage',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'beverage';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('beverage'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'sauce',
                    isSelected: selectedCategory == 'sauce',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'sauce';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('sauce'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'marinade',
                    isSelected: selectedCategory == 'marinade',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'marinade';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('marinade'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'fingerfood',
                    isSelected: selectedCategory == 'fingerfood',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'fingerfood';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('fingerfood'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'snack',
                    isSelected: selectedCategory == 'snack',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'snack';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('snack'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'drink',
                    isSelected: selectedCategory == 'drink',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'drink';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('drink'));
                    },
                  ),
                  FoodCategoryChip(
                    label: 'appetizer',
                    isSelected: selectedCategory == 'appetizer',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'appetizer';
                      });
                      BlocProvider.of<FoodBloc>(context)
                          .add(SelectCategory('appetizer'));
                    },
                  ),
                ],
              ),
            ),
          ),
          // List of Foods
          Expanded(
            child: BlocBuilder<FoodBloc, FoodState>(
              builder: (context, state) {
                if (state is FoodLoading && state is! FoodLoaded) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FoodLoaded) {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent &&
                          state.hasMore) {
                        BlocProvider.of<FoodBloc>(context).add(FetchFoodList(
                          isLoadMore: true,
                          category:
                              selectedCategory, // Pass the selected category for pagination
                        ));
                      }
                      return false;
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: state.hasMore
                          ? state.foodItems.length + 1
                          : state.foodItems.length,
                      itemBuilder: (context, index) {
                        if (index < state.foodItems.length) {
                          final food = state.foodItems[index];
                          return FoodCard(
                            foodItem: food,
                            selectedCategory: selectedCategory,
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  );
                } else if (state is FoodError) {
                  return Center(child: Text('Error: ${state.error}'));
                } else {
                  return const Center(child: Text('No data available.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
