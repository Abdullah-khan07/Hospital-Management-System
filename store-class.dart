import 'medicine-class.dart';
import 'sale-class.dart';

class Store {
  List<Medicine> medicines = [];
  List<Sale> sales = [];

  void addMedicine(Medicine medicine) {
    medicines.add(medicine);
    print('Medicine added: ${medicine.name}');
  }

  void removeMedicine(int id) {
    medicines.removeWhere((medicine) => medicine.id == id);
    print('Medicine removed with ID: $id');
  }

  void listMedicines() {
    if (medicines.isEmpty) {
      print('No medicines available.');
    } else {
      for (var medicine in medicines) {
        print('ID: ${medicine.id}, Name: ${medicine.name}, Price: \$${medicine.price}, Quantity: ${medicine.quantity}');
      }
    }
  }

  void updateMedicineQuantity(int id, int newQuantity) {
    for (var medicine in medicines) {
      if (medicine.id == id) {
        medicine.quantity = newQuantity;
        print('Updated quantity for medicine ID: $id to $newQuantity');
        return;
      }
    }
    print('Medicine not found with ID: $id');
  }

  void recordSale(int medicineId, int quantity) {
    for (var medicine in medicines) {
      if (medicine.id == medicineId) {
        if (medicine.quantity >= quantity) {
          medicine.quantity -= quantity;
          sales.add(Sale(medicineId: medicineId, quantity: quantity, date: DateTime.now()));
          print('Sale recorded: Medicine ID $medicineId, Quantity: $quantity');
        } else {
          print('Not enough stock for medicine ID: $medicineId');
        }
        return;
      }
    }
    print('Medicine not found with ID: $medicineId');
  }

  void listSales() {
    if (sales.isEmpty) {
      print('No sales recorded.');
    } else {
      for (var sale in sales) {
        print('Medicine ID: ${sale.medicineId}, Quantity: ${sale.quantity}, Date: ${sale.date}');
      }
    }
  }

  void listTodaySalesIncome() {
    DateTime today = DateTime.now();
    var todaySales = sales.where((sale) =>
        sale.date.year == today.year &&
        sale.date.month == today.month &&
        sale.date.day == today.day);
    
    if (todaySales.isEmpty) {
      print('No sales recorded for today.');
    } else {
      double totalIncome = 0.0;
      Map<int, double> medicineIncome = {};

      for (var sale in todaySales) {
        var medicine = medicines.firstWhere((medicine) => medicine.id == sale.medicineId, orElse: () => Medicine(id: 0, name: '', price: 0.0, quantity: 0));
        double income = sale.quantity * medicine.price;
        totalIncome += income;

        if (medicineIncome.containsKey(sale.medicineId)) {
          medicineIncome[sale.medicineId] = medicineIncome[sale.medicineId]! + income;
        } else {
          medicineIncome[sale.medicineId] = income;
        }
      }

      print('Today\'s Sales Income:');
      medicineIncome.forEach((medicineId, income) {
        var medicine = medicines.firstWhere((medicine) => medicine.id == medicineId, orElse: () => Medicine(id: 0, name: '', price: 0.0, quantity: 0));
        print('Medicine: ${medicine.name}, Income: \$${income.toStringAsFixed(2)}');
      });
      print('Total Income: \$${totalIncome.toStringAsFixed(2)}');
    }
  }
}