import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class PermessionPrinter {
  void permessionPrinter() async {
    // PermissionStatus bluetoothStatus = await Permission.bluetooth.status;
    // if (bluetoothStatus != PermissionStatus.granted) {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothAdvertise,
      Permission.bluetoothConnect,
      // Permission.location // Add other permissions as needed
    ].request();

    // Check the status of each permission
    log("statuses: $statuses");
    // } else {
    //   // Permissions are already granted
    //   print('Permissions are already granted');
    // }
  }
}
