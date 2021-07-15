import 'package:flutter/material.dart';
import 'package:second_app_flutter/RecipScreen.dart';
import 'package:second_app_flutter/recipe.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipScreen(
        recipe: Recipe(
            "FoodFast",
            "Par Oumar",
            "https://cdn.pixabay.com/photo/2014/07/08/12/34/pizza-386717_960_720.jpg",
            "description",
            true,
            19),
      ),
    );
  }
}
