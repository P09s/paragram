import 'package:flutter/material.dart';

class StoryBoxes extends StatelessWidget {
  final function;

  StoryBoxes({this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 120,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey),
        ),
      ),
    );
  }
}
