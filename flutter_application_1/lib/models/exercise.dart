// models/exercise.dart

class Exercise {
  final String title;
  final String description;
  final String category;
  final List<String> muscleGroups;
  final List<ExerciseSet> sets; // Update this line

  Exercise({
    required this.title,
    required this.description,
    required this.category,
    required this.muscleGroups,
    required this.sets, // Update this line
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    List<dynamic> setsData = json['sets'] ?? [];
    List<ExerciseSet> parsedSets = setsData.map((set) => ExerciseSet.fromJson(set)).toList();

    return Exercise(
      title: json['title'],
      description: json['description'],
      category: json['category'],
      muscleGroups: List<String>.from(json['muscleGroups']),
      sets: parsedSets,
      // Add more properties here if needed
    );
  }
}

class ExerciseSet {
  final String kg;
  final String reps;
  final String rpe;

  ExerciseSet({
    required this.kg,
    required this.reps,
    required this.rpe,
  });

  factory ExerciseSet.fromJson(Map<String, dynamic> json) {
    return ExerciseSet(
      kg: json['kg'],
      reps: json['reps'],
      rpe: json['rpe'],
    );
  }
}