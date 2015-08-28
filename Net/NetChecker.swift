//
//  NetChecker.swift
//  MSC Mobile
//
//  Created by Mario Sanchez Macias on 28/8/15.
//  Copyright © 2015 Mario Sanchez Macias. All rights reserved.
//
// Updated for swift 2.0
// Usage:
//if NetChecker.isConnectedToNetwork() == true {
//    print("Internet connection OK")
//} else {
//    print("Internet connection FAILED")
//}


import Foundation
import SystemConfiguration

public class NetChecker {
    class func isConnectedToNetwork() -> Bool {
        
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(&zeroAddress, {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }) else {
            return false
        }
        
        var flags : SCNetworkReachabilityFlags = []
        if SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags){
            return false
        }
        
        let isReachable = flags.contains(.Reachable)
        let needsConnection = flags.contains(.ConnectionRequired)
        return (isReachable && !needsConnection)    }
}
