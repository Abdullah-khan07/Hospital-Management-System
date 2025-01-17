import 'dart:io';
import 'sale.dart';
import 'store.dart';
import 'product.dart';

void main() {
  Store store = Store();

  while (true) {
    print('\nStore Management System');
    print('1. Add Product');
    print('2. Remove Product');
    print('3. List Products');
    print('4. Update Product Quantity');
    print('5. Record Sale');
    print('6. View All Sales');
    print('7. View Today\'s Sales Income');
    print('8. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter product ID: ');
        int id = int.parse(stdin.readLineSync()!);
        stdout.write('Enter product name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter product price: ');
        double price = double.parse(stdin.readLineSync()!);
        stdout.write('Enter product quantity: ');
        int quantity = int.parse(stdin.readLineSync()!);

        store.addProduct(Product(id: id, name: name, price: price, quantity: quantity));
        break;

      case '2':
        stdout.write('Enter product ID to remove: ');
        int id = int.parse(stdin.readLineSync()!);
        store.removeProduct(id);
        break;

      case '3':
        store.listProducts();
        break;

      case '4':
        stdout.write('Enter product ID to update: ');
        int id = int.parse(stdin.readLineSync()!);
        stdout.write('Enter new quantity: ');
        int quantity = int.parse(stdin.readLineSync()!);
        store.updateProductQuantity(id, quantity);
        break;

      case '5':
        stdout.write('Enter product ID for sale: ');
        int productId = int.parse(stdin.readLineSync()!);
        stdout.write('Enter quantity sold: ');
        int quantity = int.parse(stdin.readLineSync()!);

        store.recordSale(productId, quantity);
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