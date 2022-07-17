import 'package:flutter/material.dart';

class CategoriesMealsPage extends StatelessWidget {
  const CategoriesMealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Receitas"),),
      body: const Center(child: Text("Receitas por categoria"),),
    );
  }
}
