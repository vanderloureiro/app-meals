import 'package:flutter/material.dart';

import '../models/category.dart';
import '../pages/categories_meals_page.dart';

class CategoryItem extends StatelessWidget {

  final Category category;

  const CategoryItem(this.category, {Key? key}) : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) {
              return CategoriesMealsPage(category);
            },
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
      ),
    );
  }
}
