//
//  Service.swift
//  TestApp
//
//  Created by Corné den Otter on 10/03/16.
//  Copyright © 2016 Infi. All rights reserved.
//

import UIKit

class Service: NSObject {
    var repository: RepositoryProtocol;
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func findByTitle(title: String, callback: (MediaItem?) -> Void) {
        repository.findByTitle(title, callback: callback)
    }
}
