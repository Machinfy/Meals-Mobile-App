import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/blocs/favorites_cubit/favorites_cubit.dart';
import 'package:meals/blocs/favorites_cubit/favorites_states.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    // required this.meal
  });

  // final Meal meal;
  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final meal = routeData['meal'] as Meal;

    return Scaffold(
        appBar: AppBar(title: Text(meal.title), actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<FavoritesCubit>(context)
                  .changeFavoriteStatus(meal: meal);
            },
            icon: BlocConsumer<FavoritesCubit, FavoritesState>(
              listener: (context, state) {
                if (state is FavoritesChangedState) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  if (state.isAdding) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Meal added to favorites successfully')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Meal deleted from favorites successfully.',
                          style: TextStyle(color: Colors.white),
                        )));
                  }
                }
              },
              builder: (context, state) {
                final favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
                return Icon(
                  Icons.star,
                  color: favoritesCubit.isMealInFavorite(meal: meal)
                      ? Colors.green
                      : Colors.grey,
                );
              },
            ),
          )
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 14),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              const SizedBox(height: 24),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
            ],
          ),
        ));
  }
}
