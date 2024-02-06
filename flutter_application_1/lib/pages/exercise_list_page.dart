// pages/exercise_list_page.dart

import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../widgets/exercise_card.dart';
import '../pages/exercise_form_page.dart';
import '../helpers/database_helper.dart'; // Import the DatabaseHelper

class ExerciseListPage extends StatefulWidget {
  @override
  _ExerciseListPageState createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  late List<Exercise> exercises;
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _loadExercises();
  }

  Future<void> _loadExercises() async {
    final fetchedExercises = await _databaseHelper.getAllExercises();
    setState(() {
      exercises = fetchedExercises;
    });
  }

  void _addExercise() async {
    final newExercise = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExerciseFormPage()),
    );

    if (newExercise != null && newExercise is Exercise) {
      setState(() {
        exercises.add(newExercise);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addExercise,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ExerciseCard(
            exercise: exercises[index],
            onTap: () {
              Navigator.pop(context, exercises[index]);
            },
          );
        },
      ),
    );
  }
}
