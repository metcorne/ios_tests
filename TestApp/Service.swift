//
//  Service.swift
//  TestApp
//
//  Created by Corné den Otter on 10/03/16.
//  Copyright © 2016 Infi. All rights reserved.
//

import UIKit

class Service: NSObject {
    var apiClient: APICientProtocol;
    
    init(apiClient: APICientProtocol) {
        self.apiClient = apiClient
    }
    
    func findByTitle(title: String, callback: (MediaItem?) -> Void) {
        apiClient.findByTitle(title, callback: callback)
    }
}
