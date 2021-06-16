import 'package:kuama_dart_domain/launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class LauncherRepositoryImpl implements LauncherRepository {
  @override
  Stream<bool> launchAppSettings() async* {
    yield await openAppSettings();
  }
}
