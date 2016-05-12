//
//  ABCacheManager.swift
//  ABUtilities
//
//  Created by Alexandre barbier on 25/09/14.
//  Copyright (c) 2014 Alexandre barbier. All rights reserved.
//

import Foundation

public class ABCacheManager {
    
    public class func getDocumentDirectory() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentDirectory = paths[0] as String
        let bundlePath = NSBundle.mainBundle().bundleIdentifier
        let path = "\(documentDirectory)/\(bundlePath!).data"
        do{
            try NSFileManager.defaultManager().createDirectoryAtPath(path, withIntermediateDirectories: false, attributes: nil)
        }
        catch let error as NSError {
            print("\(error.description)")
        }
        
        return path
    }
    
    public class func getPathForFilename(filename:String) -> String {
        return "\(getDocumentDirectory())/\(getFilenameForEndPoint(filename))"
    }
    
    public class func getFilenameForEndPoint(endPoint:String) -> String {
        var filename = endPoint.stringByReplacingOccurrencesOfString("/", withString: "_", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        filename = filename.stringByReplacingOccurrencesOfString("#", withString: "_", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        filename = filename.stringByReplacingOccurrencesOfString(":", withString: "_", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        filename = filename.stringByReplacingOccurrencesOfString("-", withString: "_", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        filename = filename.stringByReplacingOccurrencesOfString("?", withString: "_", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        filename = filename.stringByReplacingOccurrencesOfString("*", withString: "_", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        return filename
    }
    

}