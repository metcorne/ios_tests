//
//  MockService.swift
//  TestApp
//
//  Created by Corné den Otter on 10/03/16.
//  Copyright © 2016 Infi. All rights reserved.
//

import UIKit

class StubbedAPICient: APICientProtocol {
    func findByTitle(title: String, callback: (MediaItem?) -> Void) {
        let id = "tt2861424"
        let title = "Rick and Morty"
        let title_description = "2013 TV series,     <a href='/name/nm1363595/'>Dan Harmon</a>..."
        
        let model = MediaItem(id: id, title: title, title_description: title_description)

        callback(model)
    }

}
