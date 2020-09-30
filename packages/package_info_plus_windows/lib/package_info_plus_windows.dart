/// The Windows implementation of `package_info_plus`.
library package_info_plus_windows;

import 'dart:io';

import 'package:package_info_plus_platform_interface/package_info_data.dart';
import 'package:package_info_plus_platform_interface/package_info_platform_interface.dart';

import 'src/file_version_info.dart';

/// The Windows implementation of [PackageInfoPlatform].
class PackageInfoWindows extends PackageInfoPlatform {
  /// Returns a map with the following keys:
  /// appName, packageName, version, buildNumber
  @override
  Future<PackageInfoData> getAll() {
    final info = FileVersionInfo(Platform.resolvedExecutable);
    final data = PackageInfoData(
      appName: info.productName,
      packageName: info.internalName,
      version: info.productVersion,
      buildNumber: info.fileVersion,
    );
    info.dispose();
    return Future.value(data);
  }
}
