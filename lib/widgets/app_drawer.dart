import 'package:flutter/material.dart';
import 'package:meals/screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer(
      {super.key,
      required this.selectedFilters,
      required this.onFiltersScreenPop});

  final Map<Filter, bool> selectedFilters;
  final void Function({required Map<Filter, bool> selectedFilters})
      onFiltersScreenPop;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const AppDrawerHeader(),
          DrawerListTile(
            iconData: Icons.restaurant,
            title: 'Meals',
            onDrawerTilePressed: () {
              // pop the latest screen or widget from the navigation stack
              Navigator.of(context).pop();
            },
          ),
          DrawerListTile(
            iconData: Icons.settings,
            title: 'Filters',
            onDrawerTilePressed: () async {
              // Pushing into Navigation Stack Code
              /// Creating route on the fly
              // final result =
              //     await Navigator.of(context).push<Map<Filter, bool>>(
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return FiltersScreen(
              //         selectedFilters: selectedFilters,
              //       );
              //     },
              //   ),
              // );

              ///Another Routing Method using named routes
              Navigator.of(context)
                  .pushNamed('/filters', arguments: selectedFilters)
                  .then((result) {
                result as Map<Filter, bool>;
                onFiltersScreenPop(selectedFilters: result);
              });

              /// Same Code as the above code
              // final result = await Navigator.of(context).pushNamed('/filters',
              //     arguments: selectedFilters) as Map<Filter, bool>;

              // onFiltersScreenPop(selectedFilters: result);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.iconData,
      required this.title,
      required this.onDrawerTilePressed});

  final IconData iconData;
  final String title;
  final void Function() onDrawerTilePressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDrawerTilePressed,
      child: ListTile(
        leading: Icon(
          iconData,
          size: 26,
          // the same default color of the leading icon
          color: Theme.of(context).colorScheme.onBackground,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 24,
                // the same default color of the title widget
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryContainer,
          Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Row(
          children: [
            Icon(
              Icons.fastfood,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 18),
            Text(
              'Cooking Up!',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ));
  }
}
