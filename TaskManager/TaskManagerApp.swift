//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Mert Köksal on 12.10.2020.
//

import SwiftUI
import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct TaskManagerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup { ContentView().environmentObject(SelectedTask()) }
    }
}
