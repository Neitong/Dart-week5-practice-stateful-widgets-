import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableButton(),
          SizedBox(height: 20,),
          SelectableButton(),
          SizedBox(height: 20),
          SelectableButton(),
          SizedBox(height: 20),
          SelectableButton(),
        ],
      ),
    ),
  ),
));

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  // 1. Create the state variable
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    // 2. Logic to determine properties based on state
    // Reference: [cite: 49]
    String textLabel = _isSelected ? "Selected" : "Not selected";
    Color textColor = _isSelected ? Colors.white : Colors.black;
    Color? backgroundColor = _isSelected ? Colors.blue[500] : Colors.blue[50];

    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        // 3. Change the button background using styleFrom [cite: 51]
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: () {
          // 4. Change the state value upon button click
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: Center(
          child: Text(
            textLabel,
            style: TextStyle(
              color: textColor,
              fontSize: 20, // Optional: made text slightly larger for readability
            ),
          ),
        ),
      ),
    );
  }
}