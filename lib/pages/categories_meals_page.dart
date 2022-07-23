import 'package:app_meals/components/meal_item.dart';
import 'package:app_meals/data/dummy_data.dart';
import 'package:app_meals/models/meal.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoriesMealsPage extends StatelessWidget {

  final List<Meal> meals;

  const CategoriesMealsPage(this.meals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.title),),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return MealItem(categoryMeals[index]);
          }
      ),
    );
  }
}
