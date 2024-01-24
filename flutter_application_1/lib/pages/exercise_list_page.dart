import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../widgets/exercise_card.dart';
import '../pages/exercise_form_page.dart'; // Import the ExerciseFormPage
import '../data/exercise_data.dart'; // Import the exercise data

class ExerciseListPage extends StatefulWidget {
  @override
  _ExerciseListPageState createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  List<Exercise> exercises = []; // Initialize an empty list

  @override
  void initState() {
    super.initState();
    // Load exercise data when the page is initialized
    exercises = getExerciseData();
  }

  List<Exercise> getExerciseData() {
    // Replace this with your actual implementation to fetch exercise data
    return exerciseData.map((data) => Exercise.fromJson(data)).toList();
  }

  void _addExercise() async {
    // Navigate to the ExerciseFormPage and wait for a result
    final newExercise = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExerciseFormPage()),
    );

    // Check if the user submitted the form and chose an exercise
    if (newExercise != null && newExercise is Exercise) {
      // Add the new exercise to the list
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
          // Add button to navigate to ExerciseFormPage
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
              // Navigate back to the previous screen with the chosen exercise
              Navigator.pop(context, exercises[index]);
            },
          );
        },
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../models/exercise.dart';
// import '../widgets/exercise_card.dart';
// import '../data/exercise_data.dart'; // Import the exercise data

// class ExerciseListPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Exercise List'),
//       ),
//       body: ListView.builder(
//         itemCount: exerciseData.length,
//         itemBuilder: (context, index) {
//           // Create Exercise objects from the exerciseData list
//           Exercise exercise = Exercise.fromJson(exerciseData[index]);

//           return ExerciseCard(
//             exercise: exercise,
//             onTap: () {
//               // Navigate back to the previous screen with the chosen exercise
//               Navigator.pop(context, exercise);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
