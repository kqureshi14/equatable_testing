import 'package:equatable_testing/helpers/device_helper.dart';
import 'package:equatable_testing/services/services.dart';

class DeviceServiceImpl implements IDeviceService {
  @override
  ScreenSizeData screenSizeData() {
    return DeviceHelper.screenSizeData();
  }
}
