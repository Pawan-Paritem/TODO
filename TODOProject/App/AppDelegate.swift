//
//  AppDelegate.swift
//  TODOProject
//
//  Created by Pawan  on 09/10/2020.
//

#warning("folder naming is not correct little bit")
#warning("class name")

import UIKit
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Check already login
        //TodayTaskViewController
        // else
        // Login Screen
        
        let isUserLogin = UserDefaults.standard.bool(forKey: "alreadyLogin")
        var vc = UIViewController()
        
        if isUserLogin {
            vc = TodayTaskViewController()
        } else {
            vc = SignUpViewController()
        }
        
        
        
        
        
        
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }
}

