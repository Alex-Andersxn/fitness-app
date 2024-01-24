import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../widgets/exercise_card.dart';
import '../data/exercise_data.dart'; // Import the exercise data

class ExerciseListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List'),
      ),
      body: ListView.builder(
        itemCount: exerciseData.length,
        itemBuilder: (context, index) {
          // Create Exercise objects from the exerciseData list
          Exercise exercise = Exercise.fromJson(exerciseData[index]);

          return ExerciseCard(
            exercise: exercise,
            onTap: () {
              // Navigate back to the previous screen with the chosen exercise
              Navigator.pop(context, exercise);
            },
          );
        },
      ),
    );
  }
}
