class Patient {
  String id;
  String name;
  int age;

  Patient({
    required this.id,
    required this.name,
    required this.age,
  });

  @override
  String toString() {
    return 'ID: $id, Name: $name, Age: $age';
  }
}