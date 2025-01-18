import 'dart:io';
import 'medicine-class.dart';
import 'sale-class.dart';
import 'store-class.dart';

void main() {
  Store store = Store();

  while (true) {
    print('\nMedical Store Management System');
    print('1. Add Medicine');
    print('2. Remove Medicine');
    print('3. List Medicines');
    print('4. Update Medicine Quantity');
    print('5. Record Sale');
    print('6. View All Sales');
    print('7. View Today\'s Sales Income');
    print('8. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter medicine ID: ');
        int id = int.parse(stdin.readLineSync()!);
        stdout.write('Enter medicine name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter medicine price: ');
        double price = double.parse(stdin.readLineSync()!);
        stdout.write('Enter medicine quantity: ');
        int quantity = int.parse(stdin.readLineSync()!);

        store.addMedicine(Medicine(id: id, name: name, price: price, quantity: quantity));
        break;

      case '2':
        stdout.write('Enter medicine ID to remove: ');
        int id = int.parse(stdin.readLineSync()!);
        store.removeMedicine(id);
        break;

      case '3':
        store.listMedicines();
        break;

      case '4':
        stdout.write('Enter medicine ID to update: ');
        int id = int.parse(stdin.readLineSync()!);
        stdout.write('Enter new quantity: ');
        int quantity = int.parse(stdin.readLineSync()!);
        store.updateMedicineQuantity(id, quantity);
        break;

      case '5':
        stdout.write('Enter medicine ID for sale: ');
        int medicineId = int.parse(stdin.readLineSync()!);
        stdout.write('Enter quantity sold: ');
        int quantity = int.parse(stdin.readLineSync()!);

        store.recordSale(medicineId, quantity);
        break;

      case '6':
        store.listSales();
        break;

      case '7':
        store.listTodaySalesIncome();
        break;

      case '8':
        print('Exiting...');
        return;

      default:
        print('Invalid choice! Please try again.');
    }
  }
}