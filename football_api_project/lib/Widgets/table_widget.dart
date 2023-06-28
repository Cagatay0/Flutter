import 'package:flutter/material.dart';
import 'package:football_api_project/Utils/constants.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key, required this.index, required this.onTapC});
  final int index;
  final Function onTapC;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: () => onTapC(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            firstWidget(),
            secondWidget(),
          ],
        ),
      ),
    );
  }

  Widget firstWidget() {
    return SizedBox(
      width: 250,
      child: Row(
        children: [
          Image.network(tableForSelectedLeague[index]['SquadLogo']),
          const SizedBox(width: 10),
          Text(tableForSelectedLeague[index]['Name']),
        ],
      ),
    );
  }

  Widget secondWidget() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(tableForSelectedLeague[index]['Played']),
          Text(tableForSelectedLeague[index]['Winned']),
          Text(tableForSelectedLeague[index]['Tie']),
          Text(tableForSelectedLeague[index]['Loosed']),
          Text(tableForSelectedLeague[index]['Goal Difference']),
          Text(tableForSelectedLeague[index]['Points']),
        ],
      ),
    );
  }
}
