//
//  AppDelegate.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 2/9/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import FirebaseMessaging
import GoogleMaps
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                       .userDomainMask,
                                                       true)
        let path = paths.first
        print(path!)
        
        
        let _ = CoreDataManager.shared.persistentContainer.viewContext
        FirebaseApp.configure()
        GMSServices.provideAPIKey("AIzaSyDIIxDbQyPLzeFg3UajphtLbgqBsEFntC4")
        IQKeyboardManager.shared.enable = true
        AppearanceManager.shared.setupAppAppearance()
        
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        application.applicationIconBadgeNumber = 0
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            print(success)
        }
        application.registerForRemoteNotifications()
 
        if let _ = UserManager.shared.currentUser {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainTabController")
            window?.rootViewController = vc
        }
        if let notificatioOption = launchOptions?[.remoteNotification],
            let userInfo = notificatioOption as? [String:Any] {
            
            OperationQueue.main.addOperation {
                if let tabController = self.window?.rootViewController as? UITabBarController,
                    let contactanosVC = tabController.viewControllers?[1] as? ContactanosViewController {
                    tabController.selectedIndex = 1
                    contactanosVC.showAlertNotification(userInfo)
                }
            }
        }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        try? CoreDataManager.shared.persistentContainer.viewContext.save()
    }

}

// MARK: - Notificaciones
extension AppDelegate {
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
//    func application(_ application: UIApplication,
//                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        Messaging.messaging().apnsToken = deviceToken
//    }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
     
        print("FROM DID RECEIVE REMOTE: \(userInfo)")
        var contador = UserDefaults.standard.value(forKey: "contador") as? Int ?? 0
        contador += 1
        UserDefaults.standard.set(contador, forKey: "contador")
        
        if let tabController = window?.rootViewController as? UITabBarController,
            let contactanosVC = tabController.viewControllers?[1] as? ContactanosViewController {
            tabController.selectedIndex = 1
            contactanosVC.showAlertNotification(userInfo)
        }
        application.applicationIconBadgeNumber += 1
        completionHandler(.newData)
    }
    
}

// MARK: - MessagingDelegate
extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Mi FCM token es: \(fcmToken)")
        // LLAMAR A UN WEB SERVICE PARA REGISTAR EL TOKEN EN NUESTRO BACKEND
    }
    
}

// MARK: - UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let notificationJSON = notification.request.content.userInfo
        print("FROM present: \(notificationJSON)")
        
        completionHandler([.badge, .sound, .alert])
    }
}

