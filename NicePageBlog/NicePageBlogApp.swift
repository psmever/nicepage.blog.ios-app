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
        
        api.login(email: "test@test.com", password: "1212") { (result) in
            switch result {
            case true:
                debugPrint("로그인 한 상태.")
            case false:
                debugPrint("로그인 안된 상태.")
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
            ContentView()
        }
    }
}
