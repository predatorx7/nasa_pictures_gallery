import 'package:integration_test/integration_test.dart';

import '../test/app_test.dart' as app_test;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  app_test.main();
}
