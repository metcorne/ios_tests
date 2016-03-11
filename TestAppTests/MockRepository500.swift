//
//  MockRepository500.swift
//  TestApp
//
//  Created by Corné den Otter on 11/03/16.
//  Copyright © 2016 Infi. All rights reserved.
//

import UIKit

class MockRepository500: RepositoryProtocol {
    func findByTitle(title: String, callback: (MediaItem?) -> Void) {
        callback(nil)
    }
}
