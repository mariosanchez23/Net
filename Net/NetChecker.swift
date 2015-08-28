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
        var Status:Bool = false
        let url = NSURL(string: "http://google.com/")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "HEAD"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0
        
        var response: NSURLResponse?
        do{
            _ = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response) as NSData?
        }catch{}
        
        if let httpResponse = response as? NSHTTPURLResponse {
            if httpResponse.statusCode == 200 {
                Status = true
            }
        }
        
        return Status
    }
}
