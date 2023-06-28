import 'package:flutter/material.dart';
import 'package:football_api_project/Widgets/table_info_text_widget.dart';

class TableInfoWidget extends StatelessWidget {
  const TableInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Row(
          children: [
            SizedBox(
              width: 250,
              height: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TableInfoText(text: 'P'),
                  TableInfoText(text: 'W'),
                  TableInfoText(text: 'D'),
                  TableInfoText(text: 'L'),
                  TableInfoText(text: 'AVG'),
                  TableInfoText(text: 'P'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
