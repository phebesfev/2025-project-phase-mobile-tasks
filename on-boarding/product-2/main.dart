import 'dart:collection';
import 'dart:io';

void main(){
  ProductManager manager = ProductManager();
  while (true){
    print('\nChoose an option:');
    print('1: Add product');
    print('2: View specific product');
    print('3: View all products');
    print('4: Edit product');
    print('5: Delete product');
    print('6: Exit');
    stdout.write('Enter your choice: ');

    String? entered = stdin.readLineSync();
  switch (entered) {
    
    case ('1'):
      manager.addProduct();
      break;
    case ('2'):
      print(manager.showOneProduct());
      break;
    case ('3'):
      manager.showAllProducts();
      break;
    case ('4'):
       print(manager.editProduct());
       break;
    case ('5'):
      manager.deleteProduct();
      break;
    case ('6'):
      print('Exiting the program');
      return;
    default:
      print('Invalid Choice, enter the correct choice again');

  } 
  }
}

class Product {
  String name;
  String description;
  double price;

  Product(this.name, this.description, this.price);

  @override
  String toString() {
    return 'Name: $name | Description: $description | Price: $price';
  }
}




class ProductManager {
  Map<String, Product> products = HashMap();

  String addProduct() {
    stdout.write('Enter product name: ');
    String name = stdin.readLineSync()!.trim();

    if (products.containsKey(name)) {
      return 'Product "$name" already exists.';
    }

    stdout.write('Enter description: ');
    String description = stdin.readLineSync()!.trim();

    // stdout.write('Enter price: ');
    double price = readValidPrice();

    Product newProduct = Product(name, description, price);
    products[name] = newProduct;

    return 'Product "$name" added successfully!';
  }

  String showOneProduct() {
    stdout.write('Enter product name to view: ');
    String name = stdin.readLineSync()!.trim();

    if (!products.containsKey(name)) {
      return 'Product "$name" does not exist.';
    }

    return products[name]!.toString();
  }

  void showAllProducts() {
    if (products.isEmpty) {
      print('No products available.');
      return;
    }

    print('\nAll products:');
    products.forEach((name, product) => print(product.toString()));
  }

  String editProduct() {
    stdout.write('Enter product name to edit: ');
    String oldName = stdin.readLineSync()!.trim();

    if (!products.containsKey(oldName)) {
      return 'Product "$oldName" does not exist.';
    }

    stdout.write('Enter new name (or press Enter to keep "$oldName"): ');
    String newName = stdin.readLineSync()!.trim();
    if (newName.isEmpty) newName = oldName;

    stdout.write('Enter new description: ');
    String description = stdin.readLineSync()!.trim();

    // stdout.write('Enter new price: ');
    double price = readValidPrice();

    // Remove old key if name changed
    if (oldName != newName) products.remove(oldName);

    products[newName] = Product(newName, description, price);
    return 'Product "$newName" updated successfully!';
  }

  String deleteProduct() {
    stdout.write('Enter product name to delete: ');
    String name = stdin.readLineSync()!.trim();

    if (!products.containsKey(name)) {
      return 'Product "$name" does not exist.';
    }

    products.remove(name);
    return 'Product "$name" deleted successfully!';
  }
}

// a method for price input validation 
double readValidPrice() {
  while (true) {
    stdout.write('Enter price: ');
    String? input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print(' Price cannot be empty.');
      continue;
    }

    try {
      double price = double.parse(input);
      if (price < 0) {
        print(' Price cannot be negative.');
        continue;
      }
      return price;
    } catch (e) {
      print(' Invalid input. Please enter a valid number.');
    }
  }
}
