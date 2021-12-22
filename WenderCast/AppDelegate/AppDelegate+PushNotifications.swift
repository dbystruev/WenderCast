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

extension AppDelegate {
  /// Get push notification settings
  func getNotificationSettings() {
    UNUserNotificationCenter.current().getNotificationSettings { settings in
      debug("INFO Notification settings:", settings)
    }
  }
  
  /// Register for push notifications
  func registerForPushNotifications() {
    // UNUserNotificationCenter handles all notification-related activities in the app
    UNUserNotificationCenter.current()
      // REquest authorization to show notifications
      .requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] granted, error in
        // Check if permission is granted
        if !granted {
          let errorMessage = error?.localizedDescription ?? ""
          debug("ERROR: no push notifications authorization granted", errorMessage)
        }
        self?.getNotificationSettings()
      }
  }
}
