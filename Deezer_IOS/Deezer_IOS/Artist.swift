//
//  Artist.swift
//  Deezer_IOS
//
//  Created by Fayssal Mechmeche on 16/11/2022.
//

import Foundation

struct Artist {
    
    var name: String
    var picture: String
}


extension Artist {
    init?(json: [String: AnyObject]) {
            guard let name = json["title"] as? String,
                let cover = json["picture"] as? String
            else {
                return nil
            }

        
            self.name = name
            self.picture = cover
        
        
        }
}
