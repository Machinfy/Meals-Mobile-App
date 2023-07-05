import 'package:flutter/material.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: const [
        CategoryGirdItem(),
        CategoryGirdItem(),
        CategoryGirdItem(),
        CategoryGirdItem(),
        CategoryGirdItem(),
        CategoryGirdItem(),
        CategoryGirdItem(),
        CategoryGirdItem(),
        CategoryGirdItem(),
        CategoryGirdItem(),
      ],
    );
  }
}

class CategoryGirdItem extends StatelessWidget {
  const CategoryGirdItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.grey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: Text(
        'Category Name',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
