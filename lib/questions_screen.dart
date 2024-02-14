import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multiplator/popup.dart';

import 'data/multiplications.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final TextEditingController colIndexController = TextEditingController();
  final TextEditingController rowIndexController = TextEditingController();
  int targetColIndex = -1;
  int targetRowIndex = -1;

  var numbers = List<int>.generate(10, (index) => index + 1);

  @override
  void initState() {
    super.initState();
    final numberOfColumns = 11;
    dynamic columnWidthsMap =
        List<int>.generate(numberOfColumns, (index) => index)
            .asMap()
            .map((_, index) => MapEntry(index, FlexColumnWidth()));
    generateNew();
  }

  void generateNew() {
    final _random = Random();
    setState(() {
      targetColIndex = numbers[_random.nextInt(numbers.length)];
      targetRowIndex = numbers[_random.nextInt(numbers.length)];
    });
  }

  void showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Return type is Future<T> because the showDialog function returns a Future.
        // Here, we return an AlertDialog widget.
        return AlertDialog(
          title: Text('Pravilno'),
          content: Text('This is the content of my dialog.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 20, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(targetColIndex.toString(),
                      style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(width: 8),
                  Text('X', style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(width: 8),
                  Text(targetRowIndex.toString(),
                      style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(width: 8),
                  Text('=', style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(width: 8),
                  Text('?', style: Theme.of(context).textTheme.labelLarge),
                ],
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double cellWidth = (constraints.maxWidth / 11);
                double cellHeight = (constraints.maxHeight / 11);

                return Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: {
                    for (var i = 0; i < 11; i++) i: FixedColumnWidth(cellWidth)
                  },
                  children: List.generate(11, (rowIndex) {
                    return TableRow(
                      children: List.generate(11, (colIndex) {
                        return
                           GestureDetector(
                          onTap: () {
                            String cellText = multiplication_table[rowIndex -  1][colIndex -  1].toString();
                            var multipla = (targetColIndex * targetRowIndex);
                            if (cellText == multipla.toString()) {
                              showCorrectMessage(context, targetColIndex, targetRowIndex, multipla);
                              generateNew();
                            } else {
                              showWrongMessage(context, targetColIndex, targetRowIndex);
                            }
                            // if ((colIndex == targetColIndex &&
                            //         rowIndex == targetRowIndex) ||
                            //     (colIndex == targetRowIndex &&
                            //         rowIndex == targetColIndex)) {
                            //   //print('Column $targetColIndex, Row $targetRowIndex has been pressed');
                            //   showCorrectMessage(context);
                            //   generateNew();
                            // } else {
                            //   showWrongMessage(context);
                            // }
                          },
                          child:
                          Container(
                            decoration: colIndex == 0 || rowIndex == 0
                                ? null
                                : BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                            width: cellWidth,
                            height: cellHeight,
                            //color: Colors.blue[(colIndex + rowIndex *  10) %  900],
                            child:
                              (colIndex == 0 && rowIndex == 0)
                                ?
                                Center(
                                    child: null)
                            // Text('X',
                            //             style: Theme.of(context)
                            //                 .textTheme
                            //                 .bodyMedium))
                                : (rowIndex == 0)
                                    ? Center(
                                        child: null)
                                        // Text('${colIndex}',
                                        //     style: Theme.of(context)
                                        //         .textTheme
                                        //         .bodyMedium))
                                    : (colIndex == 0)
                                        ? Center(
                                            child: null)
                                            // Text('${rowIndex}',
                                            //     style: Theme.of(context)
                                            //         .textTheme
                                            //         .bodyMedium))
                                        :
                                        //Center(child: Text('(${rowIndex +  2}, ${colIndex +  2})')),
                                        Center(
                                            child: Text(
                                                '${multiplication_table[rowIndex - 1][colIndex - 1]}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge)),
                          ),
                        );
                      }).toList(),
                    );

                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
