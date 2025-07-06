import 'package:intl/intl.dart';

class EFormatters {
  /// formation of Date function
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  /// formation of currency function
  static String formatCurrency(double numnber) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(numnber);
  }

  /// formation of phone No function
  static String formatPhoneNo(String phoneNo) {
    if (phoneNo.length == 10) {
      return "(${phoneNo.substring(0, 3)}) ${phoneNo.substring(3, 6)} ${phoneNo.substring(6)}";
    } else if (phoneNo.length == 11) {
      return "(${phoneNo.substring(0, 4)}) ${phoneNo.substring(4, 7)} ${phoneNo.substring(7)}";
    }
    return phoneNo;
  }

  /// formation of the international phone no function
  static String formatInternationalPhoneNo(String phoneNo) {
    var digitsOnly = phoneNo.replaceAll(RegExp(r'\D'), '');

    /// Extract the country code from the digitsOnly
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    /// Add the remaining digits with proper formatting
    final formatterNo = StringBuffer();
    formatterNo.write('($countryCode)');
    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }
      int end = i + groupLength;
      formatterNo.write(digitsOnly.substring(i, end));
      if (end < digitsOnly.length) {
        formatterNo.write('');
      }
      i = end;
    }
    return formatterNo.toString();
  }
}
