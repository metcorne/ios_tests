//
//  MockRepository500.swift
//  TestApp
//
//  Created by Corné den Otter on 11/03/16.
//  Copyright © 2016 Infi. All rights reserved.
//

import UIKit

class StubbedAPICient500: APICientProtocol {
    func findByTitle(title: String, callback: (MediaItem?) -> Void) {
        callback(nil)
    }
}
