import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/blocs/filters_cubit/filters_cubit.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    //required this.selectedFilters,
  });

  // final Map<Filter, bool> selectedFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  //static const routeName = '/filters';
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  var _isInit = false;
  // @override
  // void initState() {
  //   // Called when the widget the created
  //   super.initState();
  //   Future.delayed(Duration.zero).then((_) {
  //     final selectedFilters =
  //         ModalRoute.of(context)!.settings.arguments as Map<Filter, bool>;
  //     setState(() {
  //       _glutenFreeFilterSet = selectedFilters[Filter.glutenFree]!;
  //       _lactoseFreeFilterSet = selectedFilters[Filter.lactoseFree]!;
  //       _vegetarianFilterSet = selectedFilters[Filter.vegetarian]!;
  //       _veganFilterSet = selectedFilters[Filter.vegan]!;
  //     });
  //   });
  //
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      final selectedFilters =
          BlocProvider.of<FiltersCubit>(context).selectedFilters;
      _glutenFreeFilterSet = selectedFilters[Filter.glutenFree]!;
      _lactoseFreeFilterSet = selectedFilters[Filter.lactoseFree]!;
      _vegetarianFilterSet = selectedFilters[Filter.vegetarian]!;
      _veganFilterSet = selectedFilters[Filter.vegan]!;
      _isInit = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        //actions: [IconButton(onPressed: () {}, icon: Icon(Icons.star))],
      ),
      body: WillPopScope(
        onWillPop: () async {
          //1
          //2
          //3 => async
          //4
          //5
          BlocProvider.of<FiltersCubit>(context)
              .changeSelectedFilters(changedFilters: {
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegan: _veganFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
          });
          return true;
        },
        child: Column(
          children: [
            FilterSwitch(
              subtitle: 'Only include gluten-free meals.',
              title: 'Gluten-free',
              currentValue: _glutenFreeFilterSet,
              onSwitchChanged: (switchValue) {
                setState(() {
                  _glutenFreeFilterSet = switchValue;
                });
              },
            ),
            FilterSwitch(
              subtitle: 'Only include lactose-free meals.',
              title: 'Lactose-free',
              currentValue: _lactoseFreeFilterSet,
              onSwitchChanged: (switchValue) {
                setState(() {
                  _lactoseFreeFilterSet = switchValue;
                });
              },
            ),
            FilterSwitch(
              subtitle: 'Only include vegetarian meals.',
              title: 'Vegetarian',
              currentValue: _vegetarianFilterSet,
              onSwitchChanged: (switchValue) {
                setState(() {
                  _vegetarianFilterSet = switchValue;
                });
              },
            ),
            FilterSwitch(
              subtitle: 'Only include vegan meals.',
              title: 'Vegan',
              currentValue: _veganFilterSet,
              onSwitchChanged: (switchValue) {
                setState(() {
                  _veganFilterSet = switchValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FilterSwitch extends StatelessWidget {
  const FilterSwitch({
    super.key,
    required this.title,
    required this.subtitle,
    required this.currentValue,
    required this.onSwitchChanged,
  });

  final bool currentValue;
  final void Function(bool) onSwitchChanged;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: currentValue,
      onChanged: onSwitchChanged,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
