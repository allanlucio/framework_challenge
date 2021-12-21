import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/core/diacritics/diacritics.dart';

void main() {
  late Diacritic diacritic;
  setUp(() {
    diacritic = DiacriticImpl();
  });
  group(
    "Diacritic",
    () {
      test(
        'Should return a string without accents when clean one',
        () async {
          final result = diacritic.clean("éáóúçÁa");
          final expected = "eaoucaa";
          expect(result, expected);
        },
      );
    },
  );
}
