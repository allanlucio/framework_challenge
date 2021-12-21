import 'package:diacritic/diacritic.dart';

abstract class Diacritic {
  String clean(String value);
}

class DiacriticImpl implements Diacritic {
  @override
  String clean(String value) {
    return removeDiacritics(value.toLowerCase());
  }
}
