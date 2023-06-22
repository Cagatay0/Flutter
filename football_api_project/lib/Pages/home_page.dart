import 'package:flutter/material.dart';
import 'package:football_api_project/API/football_api.dart';
import 'package:football_api_project/Utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print('initState');
    FootballAPI().getAllLeaugeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print(allLeagueList);
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
        futureBuilderWidget(),
      ],
    );
  }

  Widget futureBuilderWidget() {
    return FutureBuilder(
      future: FootballAPI().getAllLeaugeData(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(snapshot.connectionState.toString());
        } else {
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: allLeagueList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      print(allLeagueList[index]);
                    },
                    child: Text(allLeagueList[index]));
              },
            ),
          );
        }
      },
    );
  }
}
