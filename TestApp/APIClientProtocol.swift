//
//  RepositoryProtocol.swift
//  TestApp
//
//  Created by Corné den Otter on 10/03/16.
//  Copyright © 2016 Infi. All rights reserved.
//

import UIKit

protocol APICientProtocol {
    func findByTitle(title: String, callback: (MediaItem?) -> Void)
}
