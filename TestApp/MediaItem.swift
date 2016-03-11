//
//  Movie.swift
//  TestApp
//
//  Created by Corné den Otter on 10/03/16.
//  Copyright © 2016 Infi. All rights reserved.
//

import UIKit

class MediaItem: NSObject {
    var id: String;
    var title: String;
    var title_description: String;
    
    init(id: String, title: String, title_description: String) {
        self.id = id
        self.title = title
        self.title_description = title_description
    }
}
