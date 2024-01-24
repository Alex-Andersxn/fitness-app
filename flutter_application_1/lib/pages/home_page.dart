import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../widgets/card_widget.dart';
import '../pages/exercise_list_page.dart'; // Import the ExerciseListPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of exercises
  List<Exercise> exercises = [];

void _addExercise() async {
  // Navigate to the ExerciseListPage and wait for a result
  final chosenExercise = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ExerciseListPage()),
  );

  // Check if the user chose an exercise
  if (chosenExercise != null) {
    // Add the chosen exercise to the list
    setState(() {
      exercises.add(
        Exercise(
          title: chosenExercise.title,
          description: chosenExercise.description,
          category: chosenExercise.category,
          muscleGroups: chosenExercise.muscleGroups,
          sets: [ExerciseSet(kg: '', reps: '', rpe: '')], // Initialize with an empty set
        ),
      );
    });
  }
}


  void _removeExercise(int index) {
    // Remove the exercise from the list
    setState(() {
      exercises.removeAt(index);
    });
  }

  void _addSet(int exerciseIndex) {
    // Add a dummy set to the current exercise
    if (exercises.isNotEmpty) {
      setState(() {
        exercises[exerciseIndex].sets.add(ExerciseSet(kg: '', reps: '', rpe: ''));
      });
    }
  }

  void _removeSet(int setIndex) {
    setState(() {
      // Call the correct function with the right argument
      _removeSetFromCurrentExercise(exercises.length - 1, setIndex);
    });
  }

  void _removeSetFromCurrentExercise(int exerciseIndex, int setIndex) {
    // Implement the removal logic for the set from the current exercise
    if (exerciseIndex >= 0 &&
        exerciseIndex < exercises.length &&
        setIndex >= 0 &&
        setIndex < exercises[exerciseIndex].sets.length) {
      setState(() {
        exercises[exerciseIndex].sets.removeAt(setIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RepBook'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: exercises.length + 1,
          itemBuilder: (context, index) {
            if (index == exercises.length) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _addExercise();
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
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    _removeExercise(index);
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: CardWidget(
                    exercise: exercises[index],
                    onRemoveSet: _removeSet,
                    onAddSet: () => _addSet(index),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
