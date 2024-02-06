class ExerciseSet {
  final int id;
  final String kg;
  final String reps;
  final String rpe;

  ExerciseSet({
    required this.id,
    required this.kg,
    required this.reps,
    required this.rpe,
  });

  factory ExerciseSet.fromMap(Map<String, dynamic> map) {
    return ExerciseSet(
      id: map['id'],
      kg: map['kg'],
      reps: map['reps'],
      rpe: map['rpe'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kg': kg,
      'reps': reps,
      'rpe': rpe,
    };
  }
}
