import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text(
            'There are no favorite meals for now. Please try and add some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) => MealItem(
          id: favouriteMeals[index].id,
          title: favouriteMeals[index].title,
          imageUrl: favouriteMeals[index].imageUrl,
          affordability: favouriteMeals[index].affordability,
          complexity: favouriteMeals[index].complexity,
          duration: favouriteMeals[index].duration,
        ),
        itemCount: favouriteMeals.length,
      );
    }
  }
}
