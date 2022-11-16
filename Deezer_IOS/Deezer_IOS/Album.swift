//
//  Album.swift
//  Deezer_IOS
//
//  Created by Merwan Laouini on 16/11/2022.
//

import Foundation

struct Album {
    
    var name: String
    var cover: String
}


extension Album {
    init?(json: [String: AnyObject]) {
            guard let name = json["title"] as? String,
                let cover = json["cover"] as? String
            else {
                return nil
            }

        
            self.name = name
            self.cover = cover
        
        
        }
}
