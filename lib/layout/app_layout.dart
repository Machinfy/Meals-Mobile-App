import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/filters_screen.dart';

import '/screens/categories_tab.dart';
import '/screens/favorites_tab.dart';
import '../models/meal.dart';
import '../widgets/app_drawer.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  List<Widget> getTabs({required List<Meal> meals}) {
    return [CategoriesTab(meals: meals), const FavoritesTab()];
  }

  var _currentTabIndex = 0;
  var _selectedFilters = kInitialFilters;

  void onFiltersScreenPop({required Map<Filter, bool> selectedFilters}) {
    setState(() {
      _selectedFilters = selectedFilters;
    });
    print(_selectedFilters);
  }

  @override
  Widget build(BuildContext context) {
    // AvailableMealsBasedOnFilters
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    return Scaffold(
      drawer: AppDrawer(
          selectedFilters: _selectedFilters,
          onFiltersScreenPop: onFiltersScreenPop),
      // endDrawer: Drawer(),
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: getTabs(meals: availableMeals)[_currentTabIndex],
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
