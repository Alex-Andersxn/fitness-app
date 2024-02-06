import 'ExerciseSet.dart'; // Import ExerciseSet model if not already imported

class Exercise {

  final int id;
  final String name;
  final String description;
  final String category;
  final String muscleGroup;
  final List<ExerciseSet> sets; // Define a property to store sets

  Exercise({
    this.id = 0, // Provide a default value for id
    required this.name,
    required this.description,
    required this.category,
    required this.muscleGroup,
    required this.sets, // Initialize sets in the constructor
  });

  // Add factory method to create Exercise instance from map
  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      category: map['category'],
      muscleGroup: map['muscleGroup'],
      sets: [], // Initialize sets with an empty list
    );
  }

  // Add method to convert Exercise instance to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'muscleGroup': muscleGroup,
    };
  }
}
