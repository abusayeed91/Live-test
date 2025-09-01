import 'dart:convert';
import 'package:flutter/material.dart';
import 'recipe.dart';  // Import model

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes',
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  void loadRecipes() {
    // Normally from API, but here hardcoded JSON
    String jsonString = '''
    [
      {"title": "Pasta Carbonara", "description": "Creamy pasta dish with bacon and cheese."},
      {"title": "Caprese Salad", "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil."},
      {"title": "Banana Smoothie", "description": "Healthy and creamy smoothie with bananas and milk."},
      {"title": "Chicken Stir-Fry", "description": "Quick and flavorful stir-fried chicken with vegetables."},
      {"title": "Grilled Salmon", "description": "Delicious grilled salmon with lemon and herbs."},
      {"title": "Vegetable Curry", "description": "Spicy and aromatic vegetable curry."},
      {"title": "Berry Parfait", "description": "Layered dessert with fresh berries and yogurt."}
    ]
    ''';

    final List<dynamic> data = json.decode(jsonString);
    setState(() {
      _recipes = data.map((json) => Recipe.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Recipes"),
      ),
      body: ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          final recipe = _recipes[index];
          return ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text(
              recipe.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(recipe.description),
          );
        },
      ),
    );
  }
}
