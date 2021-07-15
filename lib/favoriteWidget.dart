import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app_flutter/favoriteChangeNotifier.dart';

class FavoriteIconWidget extends StatefulWidget {
  @override
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  bool _isFavorited = true;

  void _toggleFavorited(FavoriteChangeNotifier _notifier) {
    setState(() {
      _isFavorited = !_isFavorited;
      _notifier.isFavorited = _isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    FavoriteChangeNotifier _notifier =
        Provider.of<FavoriteChangeNotifier>(context);
    _isFavorited = _notifier.isFavorited;
    return IconButton(
      icon: _isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      color: Colors.red[400],
      onPressed: () => _toggleFavorited(_notifier),
    );
  }
}

//TODO: notifier text

class FavoriteTextWidget extends StatefulWidget {
  @override
  _FavoriteTextWidgetState createState() => _FavoriteTextWidgetState();
}

class _FavoriteTextWidgetState extends State<FavoriteTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteChangeNotifier>(
        builder: (context, notifier, _) => Text(
            notifier.favoriteCount.toString(),
            style: TextStyle(color: Colors.white)));
  }
}
