//
//  Response.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 5/4/23.
//

import Foundation
import UIKit

struct LoginResponse: Codable {
    var session_token: String
    var session_expiration: String
    var update_token: String
    
}

struct AddClothingResponse: Codable {
    var url: String
    var created_at: String
}


struct GetAllPictures: Codable {
    var assets: String
}



struct CreateOutfit: Codable {
    var id: Int
    var name: String
    var tags: [String]
}


struct ViewOutfits: Codable {
    var outfits: [OutfitObjects]
}

struct OutfitObjects: Codable {
    var name: String
    var headwear_id: String
    var top_id: String
    var bottom_id: String
    var shoes_id: String
}
