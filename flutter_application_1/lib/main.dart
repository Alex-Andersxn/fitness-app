import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_1/pages/nav_page.dart';
import '../helpers/database_helper.dart';  // Import your DatabaseHelper
import 'package:path_provider/path_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final exerciseData = [
    // Your exercise data here... data to prepopulate database.
    {
      "title": "Squat",
      "description": "A compound exercise targeting the lower body.",
      "category": "Strength Training",
      "muscleGroups": ["Quadriceps", "Hamstrings", "Glutes"]
    },
    {
      "title": "Deadlift",
      "description": "A powerful compound exercise engaging multiple muscle groups.",
      "category": "Strength Training",
      "muscleGroups": ["Hamstrings", "Lower Back", "Glutes"]
    },
    {
      "title": "Bench Press",
      "description": "A classic upper body strength exercise.",
      "category": "Strength Training",
      "muscleGroups": ["Chest", "Triceps", "Shoulders"]
    },
    {
      "title": "Push-up",
      "description": "A bodyweight exercise targeting the chest and triceps.",
      "category": "Bodyweight",
      "muscleGroups": ["Chest", "Triceps"]
    },
    {
      "title": "Pull-up",
      "description": "An upper body exercise targeting the back and biceps.",
      "category": "Bodyweight",
      "muscleGroups": ["Back", "Biceps"]
    },
    {
      "title": "Plank",
      "description": "A core-strengthening exercise in a static position.",
      "category": "Core",
      "muscleGroups": ["Abdominals"]
    },
    {
      "title": "Lunges",
      "description": "A unilateral lower body exercise to target legs and glutes.",
      "category": "Strength Training",
      "muscleGroups": ["Quadriceps", "Hamstrings", "Glutes"]
    },
    {
      "title": "Overhead Press",
      "description": "A shoulder-strengthening exercise involving the deltoids.",
      "category": "Strength Training",
      "muscleGroups": ["Shoulders"]
    },
    {
      "title": "Dips",
      "description": "An upper body exercise targeting triceps and chest.",
      "category": "Bodyweight",
      "muscleGroups": ["Triceps", "Chest"]
    },
    {
      "title": "Russian Twist",
      "description": "A core exercise that engages obliques.",
      "category": "Core",
      "muscleGroups": ["Obliques"]
    },
    {
      "title": "Hammer Curl",
      "description": "An isolation exercise for the biceps.",
      "category": "Strength Training",
      "muscleGroups": ["Biceps"]
    },
    {
      "title": "Leg Press",
      "description": "A machine-based exercise targeting the lower body.",
      "category": "Strength Training",
      "muscleGroups": ["Quadriceps", "Hamstrings", "Glutes"]
    },
    {
      "title": "Burpees",
      "description": "A full-body exercise combining squats, push-ups, and jumps.",
      "category": "Bodyweight",
      "muscleGroups": ["Full Body"]
    },
    {
      "title": "Mountain Climbers",
      "description": "A cardio and core exercise performed in a plank position.",
      "category": "Cardio",
      "muscleGroups": ["Core"]
    },
    {
      "title": "Romanian Deadlift",
      "description": "A variation of the deadlift focusing on the hamstrings.",
      "category": "Strength Training",
      "muscleGroups": ["Hamstrings"]
    },
    {
      "title": "Side Plank",
      "description": "A core-strengthening exercise performed on the side.",
      "category": "Core",
      "muscleGroups": ["Abdominals", "Obliques"]
    },
    {
      "title": "Calf Raises",
      "description": "An isolation exercise for the calf muscles.",
      "category": "Strength Training",
      "muscleGroups": ["Calves"]
    },
    {
      "title": "Box Jumps",
      "description": "A plyometric exercise for lower body power.",
      "category": "Plyometrics",
      "muscleGroups": ["Quadriceps", "Glutes"]
    },
    {
      "title": "Reverse Crunches",
      "description": "A variation of the crunch targeting the lower abs.",
      "category": "Core",
      "muscleGroups": ["Abdominals"]
    },
    {
      "title": "Tricep Dips",
      "description": "An isolation exercise for the triceps.",
      "category": "Strength Training",
      "muscleGroups": ["Triceps"]
    },
    {
      "title": "Seated Row",
      "description": "A machine-based exercise for the back muscles.",
      "category": "Strength Training",
      "muscleGroups": ["Back"]
    },

  ];

// Initialize the database helper
  final databaseHelper = DatabaseHelper();
  await databaseHelper.initializeDatabase(exerciseData);

  runApp(MyApp(databaseHelper: databaseHelper));
}

class MyApp extends StatefulWidget {
  final DatabaseHelper databaseHelper;

  const MyApp({Key? key, required this.databaseHelper}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavPage(databaseHelper: widget.databaseHelper),
    );
  }
}
