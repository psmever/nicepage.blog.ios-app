//
//  NicePageBlogApp.swift
//  NicePageBlog
//
//  Created by sm on 2020/10/27.
//

import SwiftUI
import Alamofire


// no changes in your AppDelegate class
class AppDelegate: NSObject, UIApplicationDelegate {
    private var userDefaultsManager = UserDefaultsManager()
    
    lazy var api: Api = {
        return Api()
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        UserDefaultsManager.shared.deleteAllData()
        
        #if DEBUG
            debugPrint(":: Start Debug ::")
        #elseif STAGING
            debugPrint(":: Start Staging ::")
        #elseif RELEASE
            debugPrint(":: Start Release ::")
        #endif

        
        
        if let accessToken = UserDefaultsManager.shared.getAccessToken() {
            api.loginCheck() { (result) in
                debugPrint("login check result : \(result)")
            }
        }

        return true
    }
}

@main
struct NicePageBlogApp: App {
    
    // inject into SwiftUI life-cycle via adaptor !!!
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
