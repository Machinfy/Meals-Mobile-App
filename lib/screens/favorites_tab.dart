import 'package:flutter/material.dart';
import 'package:meals/widgets/meals_list.dart';

import '../models/meal.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab(
      {super.key, required this.meals, required this.onFavoriteButtonPressed});

  final List<Meal> meals;
  final void Function({required Meal meal}) onFavoriteButtonPressed;
  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? Center(
            child: Text(
                'You do not have any meals. Start adding some favorites.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge),
          )
        : MealsList(
            meals: meals,
            onFavoriteButtonPressed: onFavoriteButtonPressed,
          );
  }
}
