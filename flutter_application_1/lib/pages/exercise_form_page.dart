// pages/exercise_form_page.dart

import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../helpers/database_helper.dart';

class ExerciseFormPage extends StatefulWidget {
  @override
  _ExerciseFormPageState createState() => _ExerciseFormPageState();
}

class _ExerciseFormPageState extends State<ExerciseFormPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String selectedCategory = 'Strength Training';
  List<String> selectedMuscleGroups = [];
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  // DatabaseHelper instance
  DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Exercise'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                Exercise newExercise = Exercise(
                name: titleController.text,
                description: descriptionController.text,
                category: selectedCategory,
                muscleGroup: selectedMuscleGroups.join(', '), // Convert list to comma-separated string
                sets: [], // Provide an empty list for sets
              );
                await _databaseHelper.insertExercise(newExercise);
                Navigator.pop(context, newExercise);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                controller: descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Description'),
              ),
              // Dropdown and checkboxes remain unchanged
            ],
          ),
        ),
      ),
    );
  }

  final List<String> muscleGroups = [
    'Quadriceps',
    'Hamstrings',
    'Glutes',
    'Lower Back',
    'Chest',
    'Triceps',
    'Shoulders',
    'Back',
    'Biceps',
    'Abdominals',
    'Obliques',
    'Calves',
    'Full Body',
  ];
}
