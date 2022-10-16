import UIKit
import Flutter
///import GoogleMobileAds  /// add this line
import GoogleMobileAds

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

        GADMobileAds.sharedInstance().start(completionHandler: nil)

    ///GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ kGADSimulatorID ]. /// added this line
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}



