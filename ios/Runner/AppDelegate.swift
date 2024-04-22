import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
  let channel = FlutterMethodChannel(name: "sqlite",
                                            binaryMessenger: controller.binaryMessenger)
    
    channel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            
            // Note: this method is invoked on the UI thread.
            guard call.method == "getTerminationCount" else {
             result(FlutterMethodNotImplemented)
                return
            }

            self?.getBatteryLevel(result: result)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func openDb() -> OpaquePointer? {
    private let terminationCount = “SELECT value FROM Test;”
private let appGroupId = “group.com.example.sajad”
private let dbPath: String = “mydb.db”
let fileManager = FileManager.default
let directory = fileManager.containerURL(forSecurityApplicationGroupIdentifier: appGroupId)
let dbFile = directory!.appendingPathComponent(dbPath)
var db: OpaquePointer?if sqlite3_open(dbFile.path, &db) != SQLITE_OK {
print(“Error opening database”)
return nil
} else {
print(“Successfully opened connection to database at \(dbPath)”)
return db
 }
}


  private func getTerminationCount(result: FlutterResult) {
    sceneDidDisconnect(_:){
         var terminationCount: String?
var queryStatement: OpaquePointer?
let sqlState = sqlite3_prepare_v2(db, queryStatementInt, -1, &queryStatement, nil)
if sqlState == SQLITE_OK {
  while sqlite3_step(queryStatement) == SQLITE_ROW {
  let value = sqlite3_column_int(queryStatement, 0)
  terminationCount = String(describing: value)
  }
} else {
  print(“UPDATE statement could not be prepared”)
}
sqlite3_finalize(queryStatement)return terminationCount

    }
    }
    var terminationCount: String?
var queryStatement: OpaquePointer?
let sqlState = sqlite3_prepare_v2(db, queryStatementInt, -1, &queryStatement, nil)
if sqlState == SQLITE_OK {
  while sqlite3_step(queryStatement) == SQLITE_ROW {
  let value = sqlite3_column_int(queryStatement, 0)
  terminationCount = String(describing: value)
  }
} else {
  print(“SELECT statement could not be prepared”)
}
sqlite3_finalize(queryStatement)return terminationCount

    }
}
