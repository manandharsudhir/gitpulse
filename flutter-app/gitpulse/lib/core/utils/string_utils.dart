import 'package:intl/intl.dart';

class StringUtils {
  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  String getNumberFromCurrency() {
    String currencyString = '\$123,456.79';

    // Create a NumberFormat instance for currency
    NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'en_US', // Locale for parsing
      symbol: '\$', // Currency symbol
      decimalDigits: 2, // Number of decimal places
    );

    // Parse the currency string to a number
    double amount = currencyFormat.parse(currencyString) as double;

    // Output: 123456.79
    return amount.toString();
  }
}
