import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    //self.window.makeSecure()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

extension UIWidow{
  /*
  func makeSecure() {
    let field = UITextField()
    field.isSecureTextEntry = true
    self.addSubview(filed)
    field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    field.centerxAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    self.layer.superlayer?.addSubview(field.layer)
    field.layer.superlayer?.first?.addSubview(self.layer)
  }
  */
}