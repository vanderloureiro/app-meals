import 'dart:ui';

import 'package:app_meals/data/dummy_data.dart';
import 'package:app_meals/models/meal.dart';
import 'package:app_meals/models/settings.dart';
import 'package:app_meals/pages/categories_meals_page.dart';
import 'package:app_meals/pages/categories_page.dart';
import 'package:app_meals/pages/meal_details_page.dart';
import 'package:app_meals/pages/navigation_page.dart';
import 'package:app_meals/pages/settings_page.dart';
import 'package:app_meals/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeals = DUMMY_MEALS;

  void filterMeals(Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        final s1 = settings.isGlutenFree && !meal.isGlutenFree;
        final s2 = settings.isLactoseFree && !meal.isLactoseFree;
        final s3 = settings.isVegan && !meal.isVegan;
        final s4 = settings.isVegetarian && !meal.isVegetarian;
        return !s1 && !s2 && !s3 && !s4;
      }).toList();
    });
  }

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
        AppRoutes.home: (context) => const NavigationPage(),
        AppRoutes.categories_meals: (context) => CategoriesMealsPage(_availableMeals),
        AppRoutes.meal_details: (context) => const MealDetailsPage(),
        AppRoutes.settings: (context) => SettingsPage(filterMeals)
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (_) => const CategoriesPage(),
      ),
    );
  }
}


