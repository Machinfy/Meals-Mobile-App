import '../../models/meal.dart';

abstract class FavoritesState {}

class FavoritesInitialState extends FavoritesState {}

class FavoritesChangedState extends FavoritesState {
  final List<Meal> favorites;
  final bool isAdding;
  final String mealId;

  FavoritesChangedState(
      {required this.favorites, required this.isAdding, required this.mealId});
}
