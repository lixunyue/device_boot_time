import Flutter
import UIKit
import QuartzCore

public class DeviceBootTimePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_boot_time", binaryMessenger: registrar.messenger())
    let instance = DeviceBootTimePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getDeviceBootTime":
      let uptime = CACurrentMediaTime()
      result(Int64(uptime * 1000))
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
