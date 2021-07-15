import 'package:flutter/material.dart';
import 'package:second_app_flutter/recipScreen.dart';
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
            "pizza easy",
            "Par Oumar",
            "https://cdn.pixabay.com/photo/2014/07/08/12/34/pizza-386717_960_720.jpg",
            "description",
            false,
            83),
      ),
    );
  }
}
