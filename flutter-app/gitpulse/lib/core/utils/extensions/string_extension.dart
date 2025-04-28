import 'package:intl/intl.dart';
import 'package:gitpulse/core/constants/app_constants.dart';

extension StringExtension on String {
  DateTime toDate() {
    return DateFormat('yyyy-MM-dd').parse(this);
  }

  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String addFullStop() {
    return "$this.";
  }

  // String getUnmaskedText() {
  //   MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
  //     mask: Constants.maskPhoneNumber,
  //   );
  //   return maskFormatter.unmaskText(this);
  // }

  // String getMaskedText() {
  //   MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
  //     mask: Constants.maskPhoneNumber,
  //   );
  //   return maskFormatter.maskText(this);
  // }

  //This is for showing in UI in format "MM/dd/yyyy";
  String getFormattedDate({String? pattern}) {
    try {
      final formatedDate =
          DateFormat(pattern ?? AppConstants.appUiDateFormat).format(
        DateTime.parse(this),
      );

      return formatedDate;
    } on FormatException {
      return this;
    } catch (e) {
      return this;
    }
  }

  String toCurrency({String locale = 'en_US', String symbol = '\$'}) {
    try {
      // Convert the string to double
      double amount = double.parse(this);

      // Format as currency
      return NumberFormat.currency(
              locale: locale, symbol: symbol, decimalDigits: 0)
          .format(amount);
    } catch (e) {
      return 'N/A';
    }
  }

  String getFirstCharacter() {
    return this[0];
  }

  String convertToTitleCase() {
    // Replace underscores with spaces
    try {
      String spaced = replaceAll('_', ' ');

      // Split into words and capitalize the first letter of each word
      List<String> words = spaced.split(' ').map((word) {
        return word[0].toUpperCase() + word.substring(1);
      }).toList();

      // Join the words back together
      return words.join(' ');
    } catch (_) {
      return "";
    }
  }

  String convertToName() {
    // Replace underscores with spaces
    List<String> words = split(RegExp(r'\s+')); // Split by spaces
    String titleCase = '';

    if (words.isNotEmpty) {
      for (String word in words) {
        if (word.isNotEmpty) {
          titleCase +=
              '${word[0].toUpperCase()}${word.substring(1).toLowerCase()} ';
        }
      }
    }

    return titleCase.trim();
  }
}
