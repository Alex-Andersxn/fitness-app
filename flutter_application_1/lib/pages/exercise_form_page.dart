import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseFormPage extends StatefulWidget {
  @override
  _ExerciseFormPageState createState() => _ExerciseFormPageState();
}

class _ExerciseFormPageState extends State<ExerciseFormPage> {
  // Define controllers for text input fields
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController muscleGroupsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Exercise'),
        actions: [
          // Add button to submit the form
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // Handle form submission and add exercise to the list
              Exercise newExercise = Exercise(
                title: titleController.text,
                description: descriptionController.text,
                category: categoryController.text,
                muscleGroups: muscleGroupsController.text.split(','),
                sets: [ExerciseSet(kg: '', reps: '', rpe: '')],
              );

              // Return the new exercise to the calling page
              Navigator.pop(context, newExercise);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // Create a form with input fields
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: muscleGroupsController,
                decoration: InputDecoration(labelText: 'Muscle Groups (comma-separated)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
