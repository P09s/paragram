import 'package:flutter/material.dart';
import 'package:paragram/screens/stories/story_1.dart';
import 'package:paragram/screens/stories/story_2.dart';
import 'package:paragram/screens/stories/story_3.dart';
import 'package:paragram/utils/colors.dart';
import 'package:paragram/utils/progress_bar.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  final List<Widget> mystories = [
    MyStory1(),
    MyStory2(),
    MyStory3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          body: Stack(
        children: [mystories[currentStoryIndex], Center(child: ProgressBar())],
      )),
    );
  }
}
