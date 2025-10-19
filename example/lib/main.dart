import 'package:device_boot_time/device_boot_time.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _deviceBootTime = 'Unknown';
  final _plugin = DeviceBootTime();

  @override
  void initState() {
    super.initState();
    initDeviceBootTimeState();
  }

  void initDeviceBootTimeState() async {
    String deviceBootTime;
    try {
      final time = await _plugin.getDeviceBootTime();
      deviceBootTime = 'Running on: $time ms';
    } catch (e) {
      deviceBootTime = 'Failed to getDeviceBootTime.\n${e.toString()}';
    }

    if (!mounted) return;

    setState(() {
      _deviceBootTime = deviceBootTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_deviceBootTime),
              ElevatedButton(
                onPressed: initDeviceBootTimeState,
                child: const Text('Update'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
