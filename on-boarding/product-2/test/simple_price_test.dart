import '../main.dart';

void main(){
  print('--- Simple Price Validation Test ---');

  // List of test scenarios
  List<String> instructions = [
    'Enter a valid number (e.g., 50)',
    'Enter a negative number first, then a valid number (e.g., -5 then 30)',
    'Enter invalid text first, then a valid number (e.g., abc then 25)'
  ];

  for (int i = 0; i < instructions.length; i++) {
    print('\nTest ${i + 1}: ${instructions[i]}');
    double price = readValidPrice();
    print('Returned price: $price');
  }

  print('\n--- Test Complete ---');
}