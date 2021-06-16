import 'package:kuama_dart_domain/permissions.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

/// [PermissionRepository]
class PermissionRepositoryImpl implements PermissionRepository {
  /// [PermissionRepository.check]
  @override
  Stream<PermissionStatus> check(Permission permission) async* {
    final status = await permission.toPermissionHandler().request();
    yield status.toStatus();
  }

  /// [PermissionRepository.request]
  @override
  Stream<PermissionStatus> request(Permission permission) async* {
    final status = await permission.toPermissionHandler().request();
    yield status.toStatus();
  }
}

extension PermissionToPermissionHandler on Permission {
  ph.Permission toPermissionHandler() {
    switch (this) {
      case Permission.contacts:
        return ph.Permission.contacts;
      case Permission.position:
        return ph.Permission.locationWhenInUse;
      case Permission.backgroundPosition:
        return ph.Permission.locationAlways;
    }
  }
}

extension PermissionStatusHandlerToPermissionStatus on ph.PermissionStatus {
  PermissionStatus toStatus() {
    switch (this) {
      case ph.PermissionStatus.permanentlyDenied:
        return PermissionStatus.permanentlyDenied;
      case ph.PermissionStatus.denied:
        return PermissionStatus.denied;
      case ph.PermissionStatus.limited:
      case ph.PermissionStatus.granted:
      case ph.PermissionStatus.restricted:
        return PermissionStatus.denied;
    }
  }
}
