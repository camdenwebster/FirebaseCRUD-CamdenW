//
//  FirebaseCRUD_CamdenWApp.swift
//  FirebaseCRUD-CamdenW
//
//  Created by Camden Webster on 4/8/24.
//

import SwiftUI
import FirebaseCore
//import FirebaseFirestore



//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
////    let db = Firestore.firestore()
//    return true
//  }
//}

@main
struct FirebaseCRUD_CamdenWApp: App {
    @StateObject var inventoryItems = DataManager()
    init() {
        FirebaseApp.configure()
    }
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(inventoryItems)
        }
    }
}
