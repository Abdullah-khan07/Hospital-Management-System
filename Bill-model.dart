class Bill {
  String patientId;
  String service;
  double cost;

  Bill({
    required this.patientId,
    required this.service,
    required this.cost,
  });

  @override
  String toString() {
    return 'Patient ID: $patientId, Service: $service, Cost: \$${cost.toStringAsFixed(2)}';
  }
}