import 'package:app_meals/components/meal_item.dart';
import 'package:app_meals/models/meal.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {

  final List<Meal> favoriteMeals;

  const FavoritesPage(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return favoriteMeals.isEmpty ?
        const Center(
          child: Text('Nenhuma refeição foi marcada como favorita!'),
        ) :
        ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (context, index) {
              return MealItem(favoriteMeals[index]);
            }
        );
  }
}
