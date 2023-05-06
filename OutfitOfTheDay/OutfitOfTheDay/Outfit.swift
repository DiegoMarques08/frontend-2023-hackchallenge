//
//  Outfit.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 5/2/23.
//

import Foundation
import UIKit

class Outfit {
    
    var name: String

    var headPic: UIImage
    var topPic: UIImage
    var bottomPic: UIImage
    var shoesPic: UIImage

//    var filters: [String]

    init(name: String, headPic: UIImage, topPic: UIImage, bottomPic: UIImage, shoesPic: UIImage) {
        self.name = name
        self.headPic = headPic
        self.topPic = topPic
        self.bottomPic = bottomPic
        self.shoesPic = shoesPic
    }
}
