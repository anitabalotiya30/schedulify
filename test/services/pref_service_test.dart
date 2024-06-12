import 'package:flutter_test/flutter_test.dart';
import 'package:schedulify/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PrefServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
