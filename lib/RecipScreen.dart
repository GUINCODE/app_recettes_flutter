import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:second_app_flutter/favoriteChangeNotifier.dart';

import 'favoriteWidget.dart';
import 'recipe.dart';

class RecipScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipScreen({Key? key, required this.recipe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //TODO: mes widgets;
    Widget titleSection = Container(
      decoration: BoxDecoration(
        color: Colors.black54,
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  recipe.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Text(
                recipe.user,
                style: TextStyle(fontSize: 16, color: Colors.grey[500]),
              )
            ],
          )),
          FavoriteIconWidget(),
          FavoriteTextWidget(),
        ],
      ),
    );

    Widget sectionBoutons = Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.purple, Icons.comment, " Commenter"),
          _buildButtonColumn(Colors.purple, Icons.share, " Partager"),
        ],
      ),
    );
    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        recipe.description,
        softWrap: true,
      ),
    );
    return ChangeNotifierProvider(
      create: (context) =>
          FavoriteChangeNotifier(recipe.isFavorite, recipe.favoriteCount),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Center(
            child: Text(
              "Restaurant LYX",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            // TODO: image local
            // Image.asset(
            //   "images/pizza.jpg",
            //   width: 600,
            //   height: 260,
            //   fit: BoxFit.cover,
            // ),
            // TODO: image depuis un url reseau et ajouter un effet de fondu a l'affichage
            // Stack(
            //   children: [
            //     Container(
            //       width: 600,
            //       height: 260,
            //       child: Center(child: CircularProgressIndicator()),
            //     ),
            //               FadeInImage.memoryNetwork(
            //       placeholder: kTransparentImage,
            //       image:
            //           "https://lh3.googleusercontent.com/proxy/Njf7MczeoSmqvnc-zsR3PdyaeYt46bY3ofR7eAMK-X9JyJ06yOcmTkn4dY_EdvjKohWR5OLMdlcCqAzzg-5DMfaloCqfddC5IVavjPJvfQzw7NFWlkQ5x-_V8o3uNzn_DUQ",
            //       width: 600,
            //       height: 260,
            //       fit: BoxFit.cover,
            //     ),
            //   ],
            // ),
            //TODO: image avec un cache associer un FadIN
            CachedNetworkImage(
              imageUrl: recipe.imageUrl,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              // placeholderFadeInDuration: PlaceholderDimensions(3) ,
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 600,
              height: 260,
              fit: BoxFit.cover,
            ),
            titleSection,
            sectionBoutons,
            descriptionSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8.2, top: 7),
          child: Icon(icon, color: color),
        ),
        Text(label,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: color, fontSize: 17))
      ],
    );
  }
}
