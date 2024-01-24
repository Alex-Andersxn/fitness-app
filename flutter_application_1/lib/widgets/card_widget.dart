// card_widget.dart
import 'package:flutter/material.dart';
import '../models/exercise.dart';

class CardWidget extends StatelessWidget {
  final Exercise exercise;
  final Function(int) onRemoveSet;
  final VoidCallback onAddSet;

  CardWidget({
    required this.exercise,
    required this.onRemoveSet,
    required this.onAddSet,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(child: Text('Set', style: TextStyle(fontWeight: FontWeight.bold))),
                    TableCell(child: Text('Kg', style: TextStyle(fontWeight: FontWeight.bold))),
                    TableCell(child: Text('Reps', style: TextStyle(fontWeight: FontWeight.bold))),
                    TableCell(child: Text('RPE', style: TextStyle(fontWeight: FontWeight.bold))),
                    TableCell(child: Container()), // Empty cell for the checkbox
                  ],
                ),
                for (int i = 0; i < exercise.sets.length; i++)
                  TableRow(
                    children: [
                      TableCell(child: Text('${i + 1}')),
                      TableCell(child: TextFormField(initialValue: exercise.sets[i].kg)),
                      TableCell(child: TextFormField(initialValue: exercise.sets[i].reps)),
                      TableCell(child: TextFormField(initialValue: exercise.sets[i].rpe)),
                      TableCell(
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Remove the set when the delete button is pressed
                            onRemoveSet(i);
                          },
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // This will call the _addSet method from HomePage
                onAddSet();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              child: Icon(
                Icons.add,
                size: 36,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
