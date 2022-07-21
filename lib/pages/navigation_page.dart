import 'package:app_meals/pages/categories_page.dart';
import 'package:app_meals/pages/favorites_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  int _selectPageIndex = 0;

  final List<Widget> _pages = [
    const CategoriesPage(),
    const FavoritesPage(),
  ];

  final List<String> _titles = [
    'Lista de Categorias',
    'Favoritos'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectPageIndex]),
      ),
      body: _pages[_selectPageIndex],
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
