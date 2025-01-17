import 'sale.dart';
import 'product.dart';

class Store {
  List<Product> products = [];
  List<Sale> sales = [];

  void addProduct(Product product) {
    products.add(product);
    print('Product added: ${product.name}');
  }

  void removeProduct(int id) {
    products.removeWhere((product) => product.id == id);
    print('Product removed with ID: $id');
  }

  void listProducts() {
    if (products.isEmpty) {
      print('No products available.');
    } else {
      for (var product in products) {
        print('ID: ${product.id}, Name: ${product.name}, Price: \$${product.price}, Quantity: ${product.quantity}');
      }
    }
  }

  void updateProductQuantity(int id, int newQuantity) {
    for (var product in products) {
      if (product.id == id) {
        product.quantity = newQuantity;
        print('Updated quantity for product ID: $id to $newQuantity');
        return;
      }
    }
    print('Product not found with ID: $id');
  }

  void recordSale(int productId, int quantity) {
    for (var product in products) {
      if (product.id == productId) {
        if (product.quantity >= quantity) {
          product.quantity -= quantity;
          sales.add(Sale(productId: productId, quantity: quantity, date: DateTime.now()));
          print('Sale recorded: Product ID $productId, Quantity: $quantity');
        } else {
          print('Not enough stock for product ID: $productId');
        }
        return;
      }
    }
    print('Product not found with ID: $productId');
  }

  void listSales() {
    if (sales.isEmpty) {
      print('No sales recorded.');
    } else {
      for (var sale in sales) {
        print('Product ID: ${sale.productId}, Quantity: ${sale.quantity}, Date: ${sale.date}');
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
      Map<int, double> productIncome = {};

      for (var sale in todaySales) {
        var product = products.firstWhere((product) => product.id == sale.productId, orElse: () => Product(id: 0, name: '', price: 0.0, quantity: 0));
        double income = sale.quantity * product.price;
        totalIncome += income;

        if (productIncome.containsKey(sale.productId)) {
          productIncome[sale.productId] = productIncome[sale.productId]! + income;
        } else {
          productIncome[sale.productId] = income;
        }
      }

      print('Today\'s Sales Income:');
      productIncome.forEach((productId, income) {
        var product = products.firstWhere((product) => product.id == productId, orElse: () => Product(id: 0, name: '', price: 0.0, quantity: 0));
        print('Product: ${product.name}, Income: \$${income.toStringAsFixed(2)}');
      });
      print('Total Income: \$${totalIncome.toStringAsFixed(2)}');
    }
  }
}