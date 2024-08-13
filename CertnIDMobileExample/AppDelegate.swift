//
//  AppDelegate.swift
//  CertnIDMobileExample
//
//  Created by Yuri Grigoriev on 02/07/2024.
//

import CertnIDMobileSDK
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let url = Bundle.main.url(forResource: "license", withExtension: "lic") {
            do {
                let license = try Data(contentsOf: url)
                try CertnIDMobileSdk.shared.initialize(
                    CertnIDSDKConfiguration(
                        licenseData: license,
                        libraries: [
                            .document,
                            .faceBalanced, // Or .faceFast
                            .nfc
                        ]
                    )
                )
            } catch {
                print("Failed to initialize CertnIDMobileSDK: \(error.localizedDescription)")
            }
        } else {
            print("Failed to initialize CertnIDMobileSDK: License not found.")
        }
        if CertnIDMobileSdk.shared.isInitialized {
            print("CertnIDMobileSdk is ready to use")
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

