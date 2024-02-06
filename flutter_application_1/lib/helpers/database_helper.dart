// helpers/database_helpers.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/exercise.dart';
import '../models/workout.dart';
import '../models/ExerciseSet.dart';

class DatabaseHelper {
  late Database _database;

  DatabaseHelper();

  Future<void> initializeDatabase(List<Map<String, dynamic>> exerciseData) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app_database.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE exercises(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, category TEXT, muscleGroup TEXT)',
        );
        await db.execute(
          'CREATE TABLE workouts(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT NOT NULL)',
        );
        await db.execute(
          'CREATE TABLE exerciseSets(id INTEGER PRIMARY KEY AUTOINCREMENT, exerciseId INTEGER, kg TEXT, reps TEXT, rpe TEXT, FOREIGN KEY (exerciseId) REFERENCES exercises (id) ON DELETE CASCADE)',
        );

        await _prepopulateDatabase(
          db,
          exerciseData.map((data) => Exercise(
            name: data['title'],
            description: data['description'],
            category: data['category'],
            muscleGroup: data['muscleGroups'][0], // Assuming muscleGroups is a list
            sets: [], // Initialize sets with an empty list
          )).toList(),
        );
      },
    );
  }

  Future<void> _prepopulateDatabase(Database db, List<Exercise> exerciseData) async {
    for (var exerciseDataItem in exerciseData) {
      await db.insert('exercises', {
        'name': exerciseDataItem.name,
        'description': exerciseDataItem.description,
        'category': exerciseDataItem.category,
        'muscleGroup': exerciseDataItem.muscleGroup,
      });
    }
  }

  // Other database methods (insert, get, update, delete) can go here
  Future<List<Exercise>> getAllExercises() async {
    final List<Map<String, dynamic>> maps = await _database.query('exercises');
    return List.generate(maps.length, (i) {
      return Exercise.fromMap(maps[i]);
    });
  }

  Future<void> insertExercise(Exercise exercise) async {
    await _database.insert('exercises', exercise.toMap());
  }


  Future<void> addExercise(Exercise exercise) async {
    await _database.insert('exercises', exercise.toMap());
  }

  Future<void> addWorkout(Workout workout) async {
    await _database.insert('workouts', workout.toMap());
  }

  Future<Workout?> getWorkoutByDate(String date) async {
    List<Map<String, dynamic>> result = await _database.query(
      'workouts',
      where: 'date = ?',
      whereArgs: [date],
    );

    if (result.isNotEmpty) {
      return Workout.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<void> deleteExercise(int id) async {
    await _database.delete(
      'exercises',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Exercise>> getExercises() async {
    final List<Map<String, dynamic>> maps = await _database.query('exercises');
    return List.generate(maps.length, (i) {
      return Exercise.fromMap(maps[i]);
    });
  }

  Future<void> insertSet(int exerciseId, ExerciseSet exerciseSet) async {
    await _database.insert('exerciseSets', {
      'exerciseId': exerciseId,
      'kg': exerciseSet.kg,
      'reps': exerciseSet.reps,
      'rpe': exerciseSet.rpe,
    });
  }

  Future<void> deleteSet(int setId) async {
    await _database.delete(
      'exerciseSets',
      where: 'id = ?',
      whereArgs: [setId],
    );
  }


}
