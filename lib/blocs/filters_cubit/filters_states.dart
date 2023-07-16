import '../../screens/filters_screen.dart';

abstract class FiltersState {}

class FiltersInitialState extends FiltersState {}

class FiltersChangedState extends FiltersState {
  final Map<Filter, bool> selectedFilters;

  FiltersChangedState({required this.selectedFilters});
}
