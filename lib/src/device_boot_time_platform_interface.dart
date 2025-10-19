import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_boot_time_method_channel.dart';

abstract class DeviceBootTimePlatform extends PlatformInterface {
  /// Constructs a DeviceBootTimePlatform.
  DeviceBootTimePlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceBootTimePlatform _instance = MethodChannelDeviceBootTime();

  /// The default instance of [DeviceBootTimePlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceBootTime].
  static DeviceBootTimePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceBootTimePlatform] when
  /// they register themselves.
  static set instance(DeviceBootTimePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Get the time since boot in milliseconds
  Future<int?> getDeviceBootTime() {
    throw UnimplementedError('getDeviceBootTime() has not been implemented.');
  }
}
