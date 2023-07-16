import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/blocs/favorites_cubit/favorites_cubit.dart';
import 'package:meals/blocs/filters_cubit/filters_cubit.dart';
import 'package:meals/blocs/meals_cubit/meals_cubit.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/screens/meals_screen.dart';

import 'layout/app_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MealsCubit>(create: (context) => MealsCubit()),
        BlocProvider<FiltersCubit>(create: (context) => FiltersCubit()),
        BlocProvider<FavoritesCubit>(create: (context) => FavoritesCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 131, 57, 0),
              brightness: Brightness.dark),
          useMaterial3: true,
          // elevatedButtonTheme: const ElevatedButtonThemeData(
          //   style: ButtonStyle(
          //     shape: MaterialStatePropertyAll(
          //       RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(4),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
          // textTheme: const TextTheme(
          //     bodyLarge: TextStyle(
          //         color: Colors.green, fontSize: 30, fontWeight: FontWeight.w500),
          //     displayLarge: TextStyle(
          //         color: Colors.green,
          //         fontSize: 40,
          //         fontWeight: FontWeight.bold)),
        ),
        routes: {
          '/filters': (BuildContext context) => const FiltersScreen(),
          '/meals': (context) => const MealsScreen(),
          '/meal-details': (context) => const MealDetailsScreen(),
        },
        // routes: {
        //   '/filters': (context) =>
        //       const FiltersScreen(selectedFilters: kInitialFilters),
        //   '/meals_overview': (context) =>
        //       MealsScreen(category: availableCategories[0], meals: dummyMeals),
        //   '/meal_details': (context) => MealDetailsScreen(meal: dummyMeals[0]),
        // },
        home: const AppLayout(),
      ),
    );
  }
}
