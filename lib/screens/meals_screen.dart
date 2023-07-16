import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

import '../models/meal.dart';
import '../widgets/meals_list.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    //required this.categoryId,
    // required this.category,
    // required this.meals,
  });

  //final String categoryId;
  // final Category category;
  // final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final routeMeals = routeData['meals'] as List<Meal>;

    final category = routeData['category'] as Category;

    final meals = routeMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    print(meals);
    // final category =
    //     availableCategories.firstWhere((category) => category.id == categoryId);
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: meals.isEmpty
          ? Center(
              child: Text('You do not have any meals. Try another category',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
            )
          : MealsList(meals: meals),
    );
  }
}
