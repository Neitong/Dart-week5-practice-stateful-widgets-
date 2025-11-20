import 'package:flutter/material.dart';

List<String> images = [
  "./assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: true, // This removes the 'DEBUG' banner from the top right corner
  home: ImageGallery(),
));

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  // State variable to track the current image index
  int _index = 0;

  // Logic to go to the previous image (Circular)
  void _showPrevious() {
    setState(() {
      // If we are at the start (0), go to the last image
      if (_index == 0) {
        _index = images.length - 1;
      } else {
        _index--;
      }
    });
  }

  // Logic to go to the next image (Circular)
  void _showNext() {
    setState(() {
      // If we are at the end, go back to the first image (0)
      if (_index == images.length - 1) {
        _index = 0;
      } else {
        _index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _showPrevious, // Call the previous function
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _showNext, // Call the next function
            ),
          ),
        ],
      ),
      // Use the index to display the correct image from the list
      body: Center(
        child: Image.asset(images[_index]),
      ),
    );
  }
}