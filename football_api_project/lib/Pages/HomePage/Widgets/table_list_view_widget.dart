import 'package:flutter/material.dart';
import 'package:football_api_project/Utils/constants.dart';
import 'package:football_api_project/Widgets/table_widget.dart';

class TableListViewWidget extends StatelessWidget {
  const TableListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: tableForSelectedLeague.length,
        itemBuilder: (context, index) {
          return TableWidget(
            index: index,
            onTapC: () {
              print(index);
            },
          );
        },
      ),
    );
  }
}
