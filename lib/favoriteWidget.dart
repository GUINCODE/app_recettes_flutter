import 'package:flutter/material.dart';

class favoriteWidget extends StatefulWidget {
  final bool isFavorited;
  final int nombreFavori;

  const favoriteWidget(
      {Key? key, required this.isFavorited, required this.nombreFavori})
      : super(key: key);

  @override
  _favoriteWidgetState createState() =>
      _favoriteWidgetState(this.isFavorited, this.nombreFavori);
}

class _favoriteWidgetState extends State<favoriteWidget> {
  bool _isFavorited;
  int _nombreFavori;

  _favoriteWidgetState(this._isFavorited, this._nombreFavori);

  void _toggleFavorited() {
    setState(() {
      _isFavorited = !_isFavorited;
      if (_isFavorited) {
        _nombreFavori++;
      } else {
        _nombreFavori--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon:
              _isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: Colors.red[400],
          onPressed: () {
            _toggleFavorited();
          },
        ),
        Text(
          '$_nombreFavori',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
