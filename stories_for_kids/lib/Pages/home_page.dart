import 'package:flutter/material.dart';
import 'package:stories_for_kids/Widgets/HomePageWidgets/list_story_grid_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return const Column(
      children: [
        ListStoryGridWidget(),
      ],
    );
  }
}
