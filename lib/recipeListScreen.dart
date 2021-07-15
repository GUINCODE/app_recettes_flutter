import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:second_app_flutter/recipe.dart';

class RecipeListeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeListeScreenState();
  }
}

class RecipeListeScreenState extends State<RecipeListeScreen> {
  final List<Recipe> recipes = [
    Recipe(
        "Riz au gras",
        "Par F Diaraye Diallo",
        "https://i.ytimg.com/vi/GFxxbUNzaDQ/maxresdefault.jpg",
        "description",
        false,
        10),
    Recipe(
        "Riz au lait",
        "Par Oumar togba",
        "https://static.750g.com/images/640-420/fe6353890df7ab674375f9d42f3a3525/riz-au-lait.jpg",
        "description",
        false,
        10),
    Recipe(
        "Akeke",
        "Par Faby ",
        "http://www.tabouencuisine.com/wp-content/uploads/2012/02/20120223_attieke_poisson_aloco_in.jpg",
        "description",
        false,
        10),
    Recipe(
        "Foutti",
        "Par Aguibou ",
        "https://recettes.africa/wp-content/uploads/2020/04/hqdefault.jpg",
        "description",
        false,
        10),
    Recipe(
        "Spaghetti",
        "Par Aguibou ",
        "https://www.valpiform.com/wp-content/uploads/2015/01/Spaghetti-girolles.jpg",
        "description",
        false,
        10),
    Recipe(
        "Spaghetti et poulet",
        "Par Aguibou ",
        "http://www.lesfoodies.com/_recipeimage/117096/cuisses-poulet-au-paprika-et-ses-vermicelles-riz.jpg",
        "description",
        false,
        10),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste de mes recettes"),
      ),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            // return RecipeItemWidget(recipe: recipes[index]); TODO: retourne une liste d'elemenet classic mais dissmisable
            final element_selected = recipes[index];
            return Dismissible(
                key: Key(element_selected.title),
                onDismissed: (direction) {
                  setState(() {
                    recipes.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("${element_selected.title} a été supprimé")));
                },
                background: Container(
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.delete_forever,
                            color: Colors.white, size: 38.0),
                        Text(
                          "Suppression de ${element_selected.title}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.red[400],
                ),
                child: RecipeItemWidget(recipe: element_selected));
          }),
    );
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(2),
      elevation: 4,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: recipe.imageUrl,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            // placeholderFadeInDuration: PlaceholderDimensions(3) ,
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(recipe.title,
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                Text(
                  recipe.user,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
