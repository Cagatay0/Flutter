import 'package:flutter/material.dart';
import 'package:football_api_project/API/football_api.dart';
import 'package:football_api_project/Pages/HomePage/home_page.dart';

Future<void> main() async {
  await FootballAPI().getAllLeagueData();
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
