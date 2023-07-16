import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/blocs/favorites_cubit/favorites_cubit.dart';
import 'package:meals/blocs/favorites_cubit/favorites_states.dart';
import 'package:meals/widgets/meals_list.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final favoriteMeals =
            BlocProvider.of<FavoritesCubit>(context).favorites;
        return favoriteMeals.isEmpty
            ? Center(
                child: Text(
                    'You do not have any meals. Start adding some favorites.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge),
              )
            : MealsList(meals: favoriteMeals);
      },
    );
  }
}
