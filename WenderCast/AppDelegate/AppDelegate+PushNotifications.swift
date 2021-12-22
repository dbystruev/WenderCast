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
  /// Register for push notifications
  func registerForPushNotifications() {
    // UNUserNotificationCenter handles all notification-related activities in the app
    UNUserNotificationCenter.current()
      // REquest authorization to show notifications
      .requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        if granted {
          print(#line, "INFO: push notifications authorization granted")
        } else {
          let errorMessage = error?.localizedDescription ?? ""
          print(#line, "ERROR: no push notifications authorization granted \(errorMessage)")
        }
      }
  }
}
