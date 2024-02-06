// models/workout.dart
// models/workout.dart

import 'dart:convert'; // Import for JSON encoding/decoding
import 'exercise.dart'; // Import the Exercise class

class Workout {
  int id;
  String date;
  List<Exercise> exercises;

  Workout({
    required this.id,
    required this.date,
    required this.exercises,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      // Convert exercises to JSON string
      'exercises': jsonEncode(exercises.map((e) => e.toMap()).toList()),
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'],
      date: map['date'],
      // Decode exercises from JSON string
      exercises: (jsonDecode(map['exercises']) as List<dynamic>)
          .map((e) => Exercise.fromMap(e))
          .toList(),
    );
  }
}
