//
//  Artist.swift
//  Deezer_IOS
//
//  Created by Fayssal Mechmeche on 16/11/2022.
//

import Foundation

struct Artist {
    
    var id:Int
    var name: String
    var picture: String
}


extension Artist {
    init?(json: [String: AnyObject]) {
            guard
                let id = json["id"] as? Int,
                let name = json["title"] as? String,
                let picture = json["picture"] as? String
            else {
                return nil
            }

            
            self.name = name
            self.picture = picture
            self.id = id
        
        
        }
}
