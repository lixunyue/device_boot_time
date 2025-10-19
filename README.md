# device_boot_time

A cross-platform Flutter plugin that retrieves the time elapsed since the system was last booted, in milliseconds.

## Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  device_boot_time: ^1.0.0+2
```

## Usage

```dart
import 'package:device_boot_time/device_boot_time.dart';

final DeviceBootTime _plugin = DeviceBootTime();

// Get the time since boot in milliseconds
final int bootTime = await _plugin.getDeviceBootTime();
```

The method returns an int representing the number of milliseconds that have elapsed since the system was last started. This value does not represent a Unix timestamp—it is a monotonic uptime counter.

## Supported platforms:

- Android
- iOS
- OpenHarmony
