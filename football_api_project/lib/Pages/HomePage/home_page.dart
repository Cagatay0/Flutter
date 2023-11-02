import 'package:flutter/material.dart';
import 'package:football_api_project/API/football_api.dart';
import 'package:football_api_project/Pages/HomePage/Widgets/table_list_view_widget.dart';
import 'package:football_api_project/Utils/constants.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(selectedLeagueText),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black.withOpacity(0.3),
        child: ListView.builder(
          itemCount: allLeagueList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  selectedLeagueText = allLeagueList[index];
                  FootballAPI().getLeagueTable();
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    allLeagueList[index],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
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
ConnectionState.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
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
