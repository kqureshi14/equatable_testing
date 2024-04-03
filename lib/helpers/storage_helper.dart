import 'dart:io';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart';
import 'package:open_filex/open_filex.dart';
import 'package:open_settings/open_settings.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

import 'package:equatable_testing/constants/constants.dart';
import 'package:equatable_testing/ui_kit/helpers/toaster_helper.dart';

class StorageHelper {
  static Future<PermissionStatus> _requestPermission() async {
    final device = DeviceInfoPlugin();
    //In case the current device is Android we need do the following
    if (Platform.isAndroid) {
      final android = await device.androidInfo;
      /* On Android devices with SDK 29 or below, we need to ask for permissions
         On Android with SDK 30 or above, we don't need to ask for permission
         So, is the SDK is 29 or lower, we call the Request function and if it is 30 or above
         we can just return Permission.granted
      */
      return android.version.sdkInt <= 29
          ? await Permission.storage.request()
          : PermissionStatus.granted;
    } else {
      //In case is iOS we still need to ask for permissions.
      final status = await Permission.storage.request();
      return status;
    }
  }

  static Future<void> saveFile({
    required BuildContext context,
    required Response response,
    required String filename,
  }) async {
    final status = await _requestPermission();
    if (status.isGranted) {
      var directory;
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory(Strings.downloadBasePath);
      }
      var dirPath = directory.path;
      if (!dirPath.endsWith('/')) {
        dirPath = dirPath + '/';
      }
      final path = dirPath + filename;
      late var file = File(path);
      if (!await file.exists()) {
        file = await file.writeAsBytes(response.bodyBytes);
      }
      /*
       As I mentioned before, we dont need to ask for permssion to saves files
       on the device, but when the code reach this line, the app is going to
       request permission because the app is accesing to a file wich is on
       a external folder.
      */
      OpenFilex.open(file.path);
      final length = await file.length();
      if (length <= 0) {
        Toaster.errorToast(
          context: context,
          message: Strings.downloadFileError,
        );
      }
    } else if (status.isDenied) {
      Toaster.errorToast(
        context: context,
        message: Strings.needPermissions,
      );
    } else if (status.isPermanentlyDenied) {
      Toaster.errorToast(
        context: context,
        message: Strings.openSettings,
        actions: [
          ToastAction.ok(
            onTap: () {
              OpenSettings.openAppSetting();
            },
          )
        ],
      );
    }
  }
}
