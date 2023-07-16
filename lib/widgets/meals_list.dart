import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealsList extends StatelessWidget {
  const MealsList({
    super.key,
    required this.meals,
  });

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: meals.length,
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => MealDetailsScreen(meal: meals[index])));

            final routeData = {
              'meal': meals[index],
            };
            Navigator.of(context)
                .pushNamed('/meal-details', arguments: routeData);
          },
          child: Card(
            color: Colors.red,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: Stack(
                //alignment: Alignment.bottomCenter,
                children: [
                  Image.network(
                    meals[index].imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black54,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        children: [
                          Text(
                            meals[index].title,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MealItemAdditionalInfo(
                                iconData: Icons.schedule,
                                info: '${meals[index].duration} min',
                              ),
                              const SizedBox(width: 12),
                              MealItemAdditionalInfo(
                                iconData: Icons.work,
                                info: meals[index].complexity.name,
                              ),
                              const SizedBox(width: 12),
                              MealItemAdditionalInfo(
                                iconData: Icons.attach_money,
                                info: meals[index].affordability.name,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MealItemAdditionalInfo extends StatelessWidget {
  const MealItemAdditionalInfo({
    super.key,
    required this.iconData,
    required this.info,
  });

  final IconData iconData;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(iconData), const SizedBox(width: 6), Text(info)],
    );
  }
}
