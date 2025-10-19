import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_boot_time_platform_interface.dart';

/// An implementation of [DeviceBootTimePlatform] that uses method channels.
class MethodChannelDeviceBootTime extends DeviceBootTimePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_boot_time');

  /// Get the time since boot in milliseconds
  @override
  Future<int?> getDeviceBootTime() async {
    final millisecond = await methodChannel.invokeMethod('getDeviceBootTime');
    return millisecond as int?;
  }
}
