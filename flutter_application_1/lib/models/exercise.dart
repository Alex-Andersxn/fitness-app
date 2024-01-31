// models/exercise.dart

class Exercise {
  final String title;
  final String description;
  final String category;
  final List<String> muscleGroups;
  final List<ExerciseSet> sets;

  Exercise({
    required this.title,
    required this.description,
    required this.category,
    required this.muscleGroups,
    required this.sets,
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'muscleGroups': muscleGroups,
      'sets': sets.map((set) => set.toJson()).toList(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      'kg': kg,
      'reps': reps,
      'rpe': rpe,
    };
  }
}
