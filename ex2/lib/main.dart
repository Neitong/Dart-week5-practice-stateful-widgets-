import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: const Text("Favorite cards"),
    ),
    body: const Column(
      children: [
        // Creating multiple instances of the card with different data
        FavoriteCard(
          title: "Flutter",
          description: "Flutter is Google's UI toolkit.",
          isFavorite: true,
        ),
        FavoriteCard(
          title: "Dart",
          description: "Dart is a client-optimized language.",
          isFavorite: false,
        ),
        FavoriteCard(
          title: "React",
          description: "React is a JavaScript library.",
          isFavorite: true,
        ),
      ],
    ),
  ),
));

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isFavorite;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  // 1. State variable to track favorite status
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    // 2. Initialize state from the widget parameter
    _isFavorite = widget.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(widget.description)
              ],
            ),
          ),
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              // 3. Ternary operator to switch icon and color based on state
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}