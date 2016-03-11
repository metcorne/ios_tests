//
//  Repository.swift
//  TestApp
//
//  Created by Corné den Otter on 10/03/16.
//  Copyright © 2016 Infi. All rights reserved.
//

import UIKit

class Repository: RepositoryProtocol {
    func findByTitle(title: String, callback: (MediaItem?) -> Void) {
        let path = String(format: "http://www.imdb.com/xml/find?json=1&nr=1&tt=on&q=%@", title.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!)
        
        let url = NSURL(string: path)!
        
        let request = NSMutableURLRequest(URL: url)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            if error != nil {
                callback(nil)
            } else {
                do {
                    let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    
                    let firstItem = jsonResult["title_popular"]![0]
                    
                    let id = firstItem["id" as NSString] as! String
                    let title = firstItem["title" as NSString] as! String
                    let title_description = firstItem["title_description" as NSString] as! String
                    
                    let model = MediaItem(id: id, title: title, title_description: title_description)
                    
                    callback(model)
                } catch {
                    callback(nil);
                }
            }
        }
        task.resume()
    }
}
