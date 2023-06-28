import 'package:flutter/material.dart';
import 'package:football_api_project/API/football_api.dart';
import 'package:football_api_project/Pages/HomePage/Widgets/table_list_view_widget.dart';
import 'package:football_api_project/Widgets/table_info_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    FootballAPI().getLeagueTable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: futureBuilderWidget(),
    );
  }

  Widget futureBuilderWidget() {
    return FutureBuilder(
      future: FootballAPI().getLeagueTable(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(snapshot.connectionState.toString());
        } else {
          return const Column(
            children: [
              SizedBox(height: 50),
              TableInfoWidget(),
              TableListViewWidget(),
            ],
          );
        }
      },
    );
  }
}
