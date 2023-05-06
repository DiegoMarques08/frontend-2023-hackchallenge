//
//  Clothing.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 5/4/23.
//

import Foundation
import UIKit

class Clothing {
    
    var id: Int
    var type: String
    var image: Data
    
    init(id: Int, type: String, image: Data) {
        self.id = id
        self.type = type
        self.image = image
    }
}
