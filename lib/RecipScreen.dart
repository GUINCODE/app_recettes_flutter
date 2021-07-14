import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'favoriteWidget.dart';

class RecipScreen extends StatelessWidget {
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
                  "Pizza Facile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Text(
                "Par Aguibou Barry",
                style: TextStyle(fontSize: 16, color: Colors.grey[500]),
              )
            ],
          )),
          favoriteWidget(isFavorited: false, nombreFavori: 26),
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
        "Veniam nulla pariatur sit et nisi laborum dolor nostrud esse incididunt Lorem voluptate. Aliquip aliqua veniam elit minim quis. Anim reprehenderit mollit tempor voluptate do dolor aliqua eiusmod. Sint ea excepteur eu mollit nostrud. Velit excepteur quis dolore amet excepteur ullamco occaecat anim consectetur veniam eiusmod voluptate elit tempor. Commodo culpa veniam quis ad. Commodo aliqua cillum qui non ullamco et ullamco. Veniam nulla pariatur sit et nisi laborum dolor nostrud esse incididunt Lorem voluptate. Aliquip aliqua veniam elit minim quis. Anim reprehenderit mollit tempor voluptate do dolor aliqua eiusmod. Sint ea excepteur eu mollit nostrud. Velit excepteur quis dolore amet excepteur ullamco occaecat anim consectetur veniam eiusmod voluptate elit tempor. Commodo culpa veniam quis ad. Commodo aliqua cillum qui non ullamco et ullamco Veniam nulla pariatur sit et nisi laborum dolor nostrud esse incididunt Lorem voluptate. Aliquip aliqua veniam elit minim quis. Anim reprehenderit mollit tempor voluptate do dolor aliqua eiusmod. Sint ea excepteur eu mollit nostrud. Velit excepteur quis dolore amet excepteur ullamco occaecat anim consectetur veniam eiusmod voluptate elit tempor. Commodo culpa veniam quis ad. Commodo aliqua cillum qui non ullamco et ullamco ",
        softWrap: true,
      ),
    );
    return Scaffold(
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
            imageUrl:
                "https://lh3.googleusercontent.com/proxy/Njf7MczeoSmqvnc-zsR3PdyaeYt46bY3ofR7eAMK-X9JyJ06yOcmTkn4dY_EdvjKohWR5OLMdlcCqAzzg-5DMfaloCqfddC5IVavjPJvfQzw7NFWlkQ5x-_V8o3uNzn_DUQ",
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
