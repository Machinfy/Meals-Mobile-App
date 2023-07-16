import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/blocs/meals_cubit/meals_states.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsCubit() : super(MealsInitialState());

  List<Meal> meals = dummyMeals;

  // void getMealsData() {
  //   meals = dummyMeals;
  //   //emit(MealsLoadedState(loadedMeals: meals));
  // }
}
