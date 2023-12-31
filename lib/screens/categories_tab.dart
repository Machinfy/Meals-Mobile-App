import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab(
      {super.key, required this.meals, required this.onFavoriteButtonPressed});

  final List<Meal> meals;
  final void Function({required Meal meal}) onFavoriteButtonPressed;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: availableCategories.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryGirdItem(
          // categoryColor: availableCategories[index].color,
          // title: availableCategories[index].title,
          // id: availableCategories[index].id,
          category: availableCategories[index],
          meals: meals,
          onFavoriteButtonPressed: onFavoriteButtonPressed,
        );
      },
      // Use children property when using normal GridView Widget
      // children: const [
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      //   CategoryGirdItem(),
      // ],
    );
  }
}

class CategoryGirdItem extends StatelessWidget {
  const CategoryGirdItem({
    super.key,
    // required this.categoryColor,
    // required this.title,
    // required this.id,
    required this.category,
    required this.meals,
    required this.onFavoriteButtonPressed,
  });

  // final Color categoryColor;
  // final String title;
  // final String id;
  final Category category;
  final List<Meal> meals;
  final void Function({required Meal meal}) onFavoriteButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// Navigation Using Page Route (On the fly)
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => MealsScreen(
        //       //categoryId: category.id,
        //       meals: meals,
        //       category: category,
        //     ),
        //   ),
        // );
        final routeData = {
          'meals': meals,
          'category': category,
          'onFavoriteButtonPressed': onFavoriteButtonPressed
        };
        Navigator.of(context).pushNamed('/meals', arguments: routeData);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            // gradient: LinearGradient(
            //   colors: [Colors.blue, Colors.grey],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
            color: category.color),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
