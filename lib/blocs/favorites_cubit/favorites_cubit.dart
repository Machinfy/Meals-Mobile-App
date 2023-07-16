import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/blocs/favorites_cubit/favorites_states.dart';

import '../../models/meal.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitialState());

  List<Meal> favorites = [];

  bool isMealInFavorite({required Meal meal}) {
    // if (favorites.contains(meal)) {
    //   return true;
    // } else {
    //   return false;
    // }
    return favorites.contains(meal);
  }

  void changeFavoriteStatus({required Meal meal}) {
    if (favorites.contains(meal)) {
      favorites.remove(meal);
      emit(FavoritesChangedState(
          favorites: favorites, isAdding: false, mealId: meal.id));
    } else {
      favorites.add(meal);
      emit(FavoritesChangedState(
          favorites: favorites, isAdding: true, mealId: meal.id));
    }
  }
}
