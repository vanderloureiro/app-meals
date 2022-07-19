import 'dart:ui';

import 'package:app_meals/pages/categories_meals_page.dart';
import 'package:app_meals/pages/categories_page.dart';
import 'package:app_meals/pages/meal_details_page.dart';
import 'package:app_meals/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed'
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const CategoriesPage(),
        AppRoutes.categories_meals: (context) => const CategoriesMealsPage(),
        AppRoutes.meal_details: (context) => const MealDetailsPage(),
      },
    );
  }
}


