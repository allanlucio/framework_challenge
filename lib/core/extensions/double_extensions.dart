import 'package:intl/intl.dart';

extension DoubleExtension on double {
  toBRLString() {
    final currencyFormatter =
        NumberFormat.currency(locale: "ptbr", symbol: "R\$");
    return currencyFormatter.format(this);
  }
}
