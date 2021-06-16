import 'package:kuama_dart_domain/kuama_dart_domain.dart';
import 'package:kuama_dart_domain/permissions.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [PermissionPreferencesRepository]
class PermissionPreferencesRepositoryImpl implements PermissionPreferencesRepository {
  final SharedPreferences pref = GetIt.I();

  final String canAskKey = 'canAskKey';

  String getCanAskKey(Permission permission) => '${permission.name}#$canAskKey';

  /// [PermissionPreferencesRepository.getCanAsk]
  @override
  Stream<bool> getCanAsk(Permission permission) async* {
    yield pref.getBool(getCanAskKey(permission)) ?? true;
  }

  /// [PermissionPreferencesRepository.setCanAsk]
  @override
  Stream<bool> setCanAsk(Permission permission, bool canAsk) async* {
    await pref.setBool(getCanAskKey(permission), canAsk);
    yield* getCanAsk(permission);
  }
}
