//
//  AppDelegate+PushNotifications.swift
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
      .requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] _, _ in
        // Print information on whether permission is granted
        self?.getNotificationSettings()
      }
  }
}
