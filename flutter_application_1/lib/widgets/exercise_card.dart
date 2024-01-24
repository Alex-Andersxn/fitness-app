import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onTap;

  ExerciseCard({required this.exercise, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(exercise.title),
        subtitle: Text(exercise.category),
        onTap: onTap,
      ),
    );
  }
}
