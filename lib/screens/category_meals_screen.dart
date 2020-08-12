import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String id;
  // final String title;
  // CategoryMealsScreen(this.id, this.title);
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryMeals = availableMeals
        .where(
          (meal) => meal.categories.contains(routeArgs['id']),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
          ),
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
