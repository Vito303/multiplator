import 'package:flutter/material.dart';

void showCorrectMessage(BuildContext context, int targetColIndex, int targetRowIndex, int multipla) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      // Schedule a delayed dismissal of the alert dialog after  3 seconds
      Future.delayed(Duration(seconds:  2), () {
        Navigator.of(context).pop(); // Close the dialog
      });

      // Return the AlertDialog widget
      return AlertDialog(
        title: Text('Pravilno!', style: Theme.of(context)
            .textTheme
            .labelMedium),
        content:
        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:  0, // Ensures the column doesn't expand beyond its children's height
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // This makes the column shrink to fit its content
              children: [
                Text(
                  '${targetColIndex} x ${targetRowIndex} = ${multipla}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text('Kar tako naprej :)'),
                // ... other children
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showWrongMessage(BuildContext context, int targetColIndex, int targetRowIndex) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      // Schedule a delayed dismissal of the alert dialog after  3 seconds
      Future.delayed(Duration(seconds:  3), () {
        Navigator.of(context).pop(); // Close the dialog
      });

      // Return the AlertDialog widget
      return AlertDialog(
        title: Text('Nepravilno!', style: Theme.of(context).textTheme.labelSmall),
        content:
        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:  0, // Ensures the column doesn't expand beyond its children's height
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // This makes the column shrink to fit its content
              children: [
                Text(
                  '${targetColIndex} x ${targetRowIndex} = ?',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}