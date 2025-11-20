import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    backgroundColor: Colors.green[100],
    appBar: AppBar(
      title: const Text("My Skill Scores"),
      backgroundColor: Colors.green[700],
    ),
    body: const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          ScoreCard(title: "My score in Flutter"),
          SizedBox(height: 20),
          ScoreCard(title: "My score in Dart"),
          SizedBox(height: 20),
          ScoreCard(title: "My score in React"),
        ],
      ),
    ),
  ),
));

class ScoreCard extends StatefulWidget {
  final String title;

  const ScoreCard({
    super.key,
    required this.title,
  });

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int _score = 5;

  void _increaseScore() {
    setState(() {
      if (_score < 10) _score++;
    });
  }

  void _decreaseScore() {
    setState(() {
      if (_score > 0) _score--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _decreaseScore,
                icon: const Icon(Icons.remove),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "$_score",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: _increaseScore,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 35,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double progressWidth =
                        constraints.maxWidth * (_score / 10);

                    // --- NEW COLOR LOGIC ---
                    Color barColor;
                    if (_score >= 7) {
                      barColor = Colors.green;
                    } else if (_score >= 4) {
                      barColor = Colors.yellow;
                    } else {
                      barColor = Colors.red;
                    }

                    return Container(
                      width: progressWidth,
                      decoration: BoxDecoration(
                        color: barColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}