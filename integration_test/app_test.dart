import './tests/login_logout.dart' as login_logout;
import 'tests/read_user.dart' as read_user;
import 'tests/update_user.dart' as update_user;
import 'tests/create_user.dart' as create_user;
import 'tests/delete_user.dart' as delete_user;

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("First Assignment Integration Test", () {
    login_logout.main();
    create_user.main();
    read_user.main();
    update_user.main();
    delete_user.main();

  });
}
