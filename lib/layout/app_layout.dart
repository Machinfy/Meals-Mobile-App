import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/blocs/filters_cubit/filters_cubit.dart';
import 'package:meals/blocs/filters_cubit/filters_states.dart';
import 'package:meals/blocs/meals_cubit/meals_cubit.dart';

import '/screens/categories_tab.dart';
import '/screens/favorites_tab.dart';
import '/screens/filters_screen.dart';
import '../models/meal.dart';
import '../widgets/app_drawer.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  var _currentTabIndex = 0;

  List<Widget> getTabs({required List<Meal> meals}) {
    return [
      BlocBuilder<FiltersCubit, FiltersState>(
        builder: (context, state) {
          final filtersCubit = BlocProvider.of<FiltersCubit>(context);
          final selectedFilters = filtersCubit.selectedFilters;
          final availableMeals = meals.where((meal) {
            if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
              return false;
            }
            if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
              return false;
            }
            if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
              return false;
            }
            if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
              return false;
            }
            return true;
          }).toList();
          return CategoriesTab(
            meals: availableMeals,
          );
        },
      ),
      const FavoritesTab()
    ];
  }

  // @override
  // void initState() {
  //   super.initState();
  //   final mealsCubit = BlocProvider.of<MealsCubit>(context);
  //   mealsCubit.getMealsData();
  // }

  @override
  Widget build(BuildContext context) {
    final meals = BlocProvider.of<MealsCubit>(context).meals;
    // AvailableMealsBasedOnFilters
    return Scaffold(
      drawer: const AppDrawer(),
      // endDrawer: Drawer(),
      appBar: AppBar(
        title: Text(_currentTabIndex == 0 ? 'Categories' : 'Favorites'),
      ),
      body: getTabs(meals: meals)[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.red,
        // unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
