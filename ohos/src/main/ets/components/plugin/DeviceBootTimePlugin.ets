import {
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
} from '@ohos/flutter_ohos';
import { BusinessError } from '@kit.BasicServicesKit';
import systemDateTime from '@ohos.systemDateTime';

/** DeviceBootTimePlugin **/
export default class DeviceBootTimePlugin implements FlutterPlugin, MethodCallHandler {
  private channel: MethodChannel | null = null;

  constructor() {
  }

  getUniqueClassName(): string {
    return "DeviceBootTimePlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.channel = new MethodChannel(binding.getBinaryMessenger(), "device_boot_time");
    this.channel.setMethodCallHandler(this)
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    if (this.channel != null) {
      this.channel.setMethodCallHandler(null)
    }
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    if (call.method == "getDeviceBootTime") {
      try {
        let time: number = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, false);
        result.success(time)
      } catch(e) {
        let error = e as BusinessError;
        result.error(`${error.code}`, error.message, null);
      }
    } else {
      result.notImplemented()
    }
  }
}