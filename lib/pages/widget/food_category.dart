import 'package:flutter/material.dart';

class FoodCategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onTap;

  const FoodCategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool selected) {
          onTap(); // Call the callback when the chip is selected
        },
      ),
    );
  }
}
