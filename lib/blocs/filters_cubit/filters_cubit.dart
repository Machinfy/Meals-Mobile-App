import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/blocs/filters_cubit/filters_states.dart';
import 'package:meals/screens/filters_screen.dart';

class FiltersCubit extends Cubit<FiltersState> {
  FiltersCubit() : super(FiltersInitialState());

  var selectedFilters = kInitialFilters;

  void changeSelectedFilters({required Map<Filter, bool> changedFilters}) {
    selectedFilters = changedFilters;
    emit(FiltersChangedState(selectedFilters: selectedFilters));
  }
}
