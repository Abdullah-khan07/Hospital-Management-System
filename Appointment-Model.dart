class Appointment {
  String patientId;
  String doctorId;

  Appointment({
    required this.patientId,
    required this.doctorId,
  });

  @override
  String toString() {
    return 'Patient ID: $patientId, Doctor ID: $doctorId';
  }
}