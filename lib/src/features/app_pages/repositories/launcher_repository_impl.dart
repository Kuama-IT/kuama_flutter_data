import 'package:kuama_dart_domain/app_pages.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPagesRepositoryImpl implements AppPagesRepository {
  @override
  Stream<bool> openSettings() async* {
    yield await openAppSettings();
  }
}
