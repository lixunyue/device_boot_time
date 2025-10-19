import 'device_boot_time_platform_interface.dart';

class DeviceBootTime {
  /// Get the time since boot in milliseconds
  Future<int?> getDeviceBootTime() {
    return DeviceBootTimePlatform.instance.getDeviceBootTime();
  }
}
