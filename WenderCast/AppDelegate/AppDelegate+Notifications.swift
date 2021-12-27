//
//  AppDelegate+Notifications.swift
//  WenderCast
//
//  Created by Denis Bystruev on 22.12.2021.
//  Copyright © 2021 Ray Wenderlich. All rights reserved.
//
//  https://www.raywenderlich.com/11395893-push-notifications-tutorial-getting-started
//

import UserNotifications
import UIKit

extension AppDelegate {
  func application(
    _ application: UIApplication,
    didFailToRegisterForRemoteNotificationsWithError error: Error
  ) {
    debug("ERROR Failed to register: \(error)")
  }
  
  func application(
    _ application: UIApplication,
    didReceiveRemoteNotification userInfo: [AnyHashable : Any],
    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
  ) {
    guard let aps = userInfo["aps"] as? [String: AnyObject] else {
      completionHandler(.failed)
      return
    }
    NewsItem.makeNewsItem(aps)
  }
  
  func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
  ) {
    let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
    let token = tokenParts.joined()
    debug("INFO Device Token: \(token)")
  }
  
  /// Get push notification settings
  func getNotificationSettings() {
    UNUserNotificationCenter.current().getNotificationSettings { settings in
      let authorizationStatus = settings.authorizationStatus
      guard authorizationStatus == .authorized else {
        debug("ERROR: no push notifications authorization granted, status: \(authorizationStatus)")
        return
      }
      DispatchQueue.main.async {
        UIApplication.shared.registerForRemoteNotifications()
      }
    }
  }
  
  /// Register for push notifications
  func registerForPushNotifications() {
    // UNUserNotificationCenter handles all notification-related activities in the app
    UNUserNotificationCenter.current()
      // REquest authorization to show notifications
      .requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] granted, _ in
        guard granted else {
          debug("INFO: Permission was not granted")
          return
        }
        
        // Create a new notification action
        let viewAction = UNNotificationAction(
          identifier: Identifiers.viewAction,
          title: "View",
          options: [.foreground]
        )
        
        // Define the new category, which will contain the view action
        let newsCategory = UNNotificationCategory(
          identifier: Identifiers.newsCategory,
          actions: [viewAction],
          intentIdentifiers: [],
          options: []
        )
        
        // Register the actionable notification
        UNUserNotificationCenter.current().setNotificationCategories([newsCategory])
        
        // Print information on whether permission is granted
        self?.getNotificationSettings()
      }
  }
}
