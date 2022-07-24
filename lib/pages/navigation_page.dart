import 'package:app_meals/components/main_drawer.dart';
import 'package:app_meals/models/meal.dart';
import 'package:app_meals/pages/categories_page.dart';
import 'package:app_meals/pages/favorites_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {

  final List<Meal> favoriteMeals;

  const NavigationPage(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  int _selectPageIndex = 0;
  List<Widget> _pages = [];

  final List<String> _titles = [
    'Lista de Categorias',
    'Favoritos'
  ];

  @override
  void initState() {
    super.initState();
    _pages = [
      const CategoriesPage(),
      FavoritesPage(widget.favoriteMeals),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectPageIndex]),
      ),
      body: _pages[_selectPageIndex],
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categorias",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favoritas"
          )
        ],
      ),
    );
  }

  _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }
}
