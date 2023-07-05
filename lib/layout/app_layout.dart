import 'package:flutter/material.dart';

import '/screens/categories_tab.dart';
import '/screens/favorites_tab.dart';
import '../widgets/app_drawer.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final _tabs = const [CategoriesTab(), FavoritesTab()];
  var _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      // endDrawer: Drawer(),
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: _tabs[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.red,
        // unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
