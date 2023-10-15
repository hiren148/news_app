import UIKit
import Flutter


private class ApiKeyImpl: ApiKeyHost {
  func getApiKey() throws -> String {
    return "57ea943e349d43eb913452164011d616"
  }
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let controller = window?.rootViewController as! FlutterViewController
    let api = ApiKeyImpl()
    ApiKeyHostSetup.setUp(binaryMessenger: controller.binaryMessenger, api: api)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
