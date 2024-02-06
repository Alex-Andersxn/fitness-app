import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../widgets/card_widget.dart';
import '../pages/exercise_list_page.dart';
import '../helpers/database_helper.dart';
import '../models/ExerciseSet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseHelper _databaseHelper;
  List<Exercise> exercises = [];

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _loadExercises();
  }

  void _loadExercises() async {
    List<Exercise> loadedExercises = await _databaseHelper.getExercises();
    setState(() {
      exercises = loadedExercises;
    });
  }

  void _addExercise() async {
    final chosenExercise = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExerciseListPage()),
    );

    if (chosenExercise != null) {
      await _databaseHelper.insertExercise(chosenExercise);
      _loadExercises(); // Reload exercises after adding a new one
    }
  }

  void _removeExercise(int exerciseId) async {
    await _databaseHelper.deleteExercise(exerciseId);
    _loadExercises(); // Reload exercises after removing one
  }

  void _addSet(int exerciseId) async {
    // Add a dummy set to the current exercise
    await _databaseHelper.insertSet(
      exerciseId,
      ExerciseSet(id: 0, kg: '', reps: '', rpe: ''), // Pass id as 0 for auto-generation
    );
    _loadExercises(); // Reload exercises after modifying sets
  }

  void _removeSet(int setId, int exerciseId) async {
    await _databaseHelper.deleteSet(setId);
    _loadExercises(); // Reload exercises after removing a set
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RepBook'),
        backgroundColor: Colors.deepPurple[400],
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
                      EdgeInsets.symmetric(vertical: 3, horizontal: 60),
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
                    _removeExercise(exercises[index].id!);
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
                    onRemoveSet: (setIndex) => _removeSet(exercises[index].sets[setIndex].id!, exercises[index].id!),
                    onAddSet: () => _addSet(exercises[index].id!),
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
