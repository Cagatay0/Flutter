import 'dart:convert';

import 'package:football_api_project/Utils/constants.dart';
import 'package:football_api_project/Utils/constants_api.dart';
import 'package:http/http.dart' as http;

class FootballAPI {
  Future<bool> getAllLeagueData() async {
    final response = await http.get(
        Uri.parse('https://football98.p.rapidapi.com/competitions'),
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': 'football98.p.rapidapi.com'
        });
    if (response.statusCode == 200) {
      String jsonString = json.decode(response.body);
      jsonString = jsonString.replaceAll('{', '').replaceAll('}', '');
      allLeagueList = jsonString.split(',');
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getLeagueTable() async {
    final response = await http.get(
        Uri.parse('https://football98.p.rapidapi.com/premierleague/table'),
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': 'football98.p.rapidapi.com'
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      tableForSelectedLeague = json.decode(response.body);
      print(tableForSelectedLeague);

      return true;
    } else {
      return false;
    }
  }

  getFixtures() async {
    final responseFixtures = await http.get(
        Uri.parse('https://football98.p.rapidapi.com/premierleague/fixtures'),
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': 'football98.p.rapidapi.com'
        });
  }
}
