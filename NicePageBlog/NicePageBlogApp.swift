//
//  NicePageBlogApp.swift
//  NicePageBlog
//
//  Created by sm on 2020/10/27.
//

import SwiftUI
import Alamofire
import StoreKit

// no changes in your AppDelegate class
class AppDelegate: NSObject, UIApplicationDelegate {
    private var userDefaultsManager = UserDefaultsManager()

    lazy var api: Api = {
        return Api()
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        UserDefaultsManager.shared.deleteAllData()



//        if let accessToken = UserDefaultsManager.shared.getAccessToken() {
//            api.loginCheck() { (result) in
//                debugPrint("login check result : \(result)")
//            }
//        }
        return true
    }
}

@main
struct NicePageBlogApp: App {

    // inject into SwiftUI life-cycle via adaptor !!!
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        
        #if DEBUG
            debugPrint(":: Debug App Start ::")
        #elseif STAGING
            debugPrint(":: Staging App Start ::")
        #elseif RELEASE
            debugPrint(":: Release App Start ::")
        #endif
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct NicePageBlogApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
