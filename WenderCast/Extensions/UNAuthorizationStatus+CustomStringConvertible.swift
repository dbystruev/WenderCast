//
//  UNAuthorizationStatus+CustomStringConvertible.swift
//  WenderCast
//
//  Created by Denis Bystruev on 22.12.2021.
//  Copyright © 2021 Ray Wenderlich. All rights reserved.
//

import UIKit

extension UNAuthorizationStatus: CustomStringConvertible {
  /// Description of UNAuthorizationStatus
  public var description: String {
    switch self {
    case .authorized:
      return ".authorized"
    case .denied:
      return ".denied"
    case .ephemeral:
      return ".ephemeral"
    case .notDetermined:
      return ".notDetermined"
    case .provisional:
      return ".provisional"
    @unknown default:
      return "unknown"
    }
  }
}
