class Doctor {
  String id;
  String name;
  String specialization;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
  });

  @override
  String toString() {
    return 'ID: $id, Name: $name, Specialization: $specialization';
  }
}