// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
// import '../models/exercise.dart';
// import '../widgets/card_widget.dart';
// import '../pages/exercise_list_page.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Exercise> exercises = [];
//   late SharedPreferences prefs; // SharedPreferences instance

//   @override
//   void initState() {
//     super.initState();
//     _loadExercises(); // Load exercises when the widget initializes
//   }

//   void _loadExercises() async {
//     prefs = await SharedPreferences.getInstance(); // Initialize SharedPreferences
//     String storedExercises = prefs.getString('exercises') ?? '[]'; // Retrieve stored exercises

//     setState(() {
//       // Update the state with the loaded exercises
//       Iterable<dynamic> decoded = jsonDecode(storedExercises);
//       exercises = decoded.map((e) => Exercise.fromJson(e)).toList();
//     });
//   }

//   void _saveExercises() {
//     // Save the exercises to SharedPreferences
//     String encoded = jsonEncode(exercises);
//     prefs.setString('exercises', encoded);
//   }

//   void _addExercise() async {
//     final chosenExercise = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => ExerciseListPage()),
//     );

//     if (chosenExercise != null) {
//       setState(() {
//         exercises.add(
//           Exercise(
//             title: chosenExercise.title,
//             description: chosenExercise.description,
//             category: chosenExercise.category,
//             muscleGroups: chosenExercise.muscleGroups,
//             sets: [ExerciseSet(kg: '', reps: '', rpe: '')],
//           ),
//         );
//         _saveExercises(); // Save exercises after adding a new one
//       });
//     }
//   }

//   void _removeExercise(int index) {
//     // Remove the exercise from the list
//     setState(() {
//       exercises.removeAt(index);
//       _saveExercises(); // Save exercises after removing one
//     });
//   }

//   void _addSet(int exerciseIndex) {
//     // Add a dummy set to the current exercise
//     if (exercises.isNotEmpty) {
//       setState(() {
//         exercises[exerciseIndex].sets.add(ExerciseSet(kg: '', reps: '', rpe: ''));
//         _saveExercises(); // Save exercises after modifying sets
//       });
//     }
//   }

//   void _removeSet(int setIndex) {
//     setState(() {
//       // Call the correct function with the right argument
//       _removeSetFromCurrentExercise(exercises.length - 1, setIndex);
//     });
//   }

//   void _removeSetFromCurrentExercise(int exerciseIndex, int setIndex) {
//     // Implement the removal logic for the set from the current exercise
//     if (exerciseIndex >= 0 &&
//         exerciseIndex < exercises.length &&
//         setIndex >= 0 &&
//         setIndex < exercises[exerciseIndex].sets.length) {
//       setState(() {
//         exercises[exerciseIndex].sets.removeAt(setIndex);
//         _saveExercises(); // Save exercises after removing a set
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('RepBook'),
//         backgroundColor: Colors.deepPurple[400],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//           itemCount: exercises.length + 1,
//           itemBuilder: (context, index) {
//             if (index == exercises.length) {
//               return Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _addExercise();
//                   },
//                   style: ButtonStyle(
//                     padding: MaterialStateProperty.all<EdgeInsets>(
//                       EdgeInsets.symmetric(vertical: 3, horizontal: 60),
//                     ),
//                   ),
//                   child: Icon(
//                     Icons.add,
//                     size: 36,
//                     color: Colors.white,
//                   ),
//                 ),
//               );
//             } else {
//               return Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: Dismissible(
//                   key: UniqueKey(),
//                   onDismissed: (direction) {
//                     _removeExercise(index);
//                   },
//                   background: Container(
//                     color: Colors.red,
//                     alignment: Alignment.centerRight,
//                     padding: EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Icon(
//                       Icons.delete,
//                       color: Colors.white,
//                     ),
//                   ),
//                   child: CardWidget(
//                     exercise: exercises[index],
//                     onRemoveSet: _removeSet,
//                     onAddSet: () => _addSet(index),
//                   ),
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import '../models/exercise.dart';
import '../widgets/card_widget.dart';
import '../pages/exercise_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Exercise> exercises = [];
  late SharedPreferences prefs; // SharedPreferences instance

  @override
  void initState() {
    super.initState();
    _loadExercises(); // Load exercises when the widget initializes
  }

  void _loadExercises() async {
    prefs = await SharedPreferences.getInstance(); // Initialize SharedPreferences
    String storedExercises = prefs.getString('exercises') ?? '[]'; // Retrieve stored exercises

    setState(() {
      // Update the state with the loaded exercises
      Iterable<dynamic> decoded = jsonDecode(storedExercises);
      exercises = decoded.map((e) => Exercise.fromJson(e)).toList();
    });
  }

  void _saveExercises() {
    // Save the exercises to SharedPreferences
    String encoded = jsonEncode(exercises);
    prefs.setString('exercises', encoded);
  }

  void _addExercise() async {
    final chosenExercise = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExerciseListPage()),
    );

    if (chosenExercise != null) {
      setState(() {
        exercises.add(
          Exercise(
            title: chosenExercise.title,
            description: chosenExercise.description,
            category: chosenExercise.category,
            muscleGroups: chosenExercise.muscleGroups,
            sets: [ExerciseSet(kg: '', reps: '', rpe: '')],
          ),
        );
        _saveExercises(); // Save exercises after adding a new one
      });
    }
  }

  void _removeExercise(int index) {
    // Remove the exercise from the list
    setState(() {
      exercises.removeAt(index);
      _saveExercises(); // Save exercises after removing one
    });
  }

  void _addSet(int exerciseIndex) {
    // Add a dummy set to the current exercise
    if (exercises.isNotEmpty) {
      setState(() {
        exercises[exerciseIndex].sets.add(ExerciseSet(kg: '', reps: '', rpe: ''));
        _saveExercises(); // Save exercises after modifying sets
      });
    }
  }

  void _removeSet(int setIndex, int exerciseIndex) {
    setState(() {
      _removeSetFromCurrentExercise(exerciseIndex, setIndex);
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
        _saveExercises(); // Save exercises after removing a set
      });
    }
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
                  onRemoveSet: (setIndex) => _removeSet(setIndex, index),
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
