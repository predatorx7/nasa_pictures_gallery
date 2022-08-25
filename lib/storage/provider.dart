import 'bookmarks/db.dart';
import 'provider/unsupported.dart'
    if (dart.library.ffi) 'provider/native.dart'
    if (dart.library.html) 'provider/web.dart';

class DatabaseConstructor {
  DatabaseConstructor._();

  static const _userAccountDbName = 'app_db.sqlite';

  static AppDatabase userAccount() => $userAccount(_userAccountDbName);
}
