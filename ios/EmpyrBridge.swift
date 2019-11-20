// EmpyrBridge.swift
import Foundation

@objc(EmpyrBridge)
class EmpyrBridge: NSObject {
  
  @objc
  func initialize(_ clientId: NSString) {
    _ = EmpyrAPIClient.initialize(clientId:clientId as String)
  }

  @objc
  func track(_ offerId: NSNumber, withTracker tracker: NSString ) {
    if (tracker == "PROFILE_VIEW") {
      EmpyrAPIClient.mainInstance().track(offerId:offerId.intValue, tracker: Tracker.PROFILE_VIEW)
    } else if (tracker == "SEARCH_VIEW") {
        EmpyrAPIClient.mainInstance().track(offerId:offerId.intValue, tracker: Tracker.SEARCH_VIEW)
    }
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return false
  }
}
