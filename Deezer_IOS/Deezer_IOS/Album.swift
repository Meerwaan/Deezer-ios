//
//  Album.swift
//  Deezer_IOS
//
//  Created by Merwan Laouini on 16/11/2022.
//

import Foundation

struct Album {
    var id: Int
    var title: String
    var cover: String
}


extension Album {
    init?(json: [String: AnyObject]) {
            guard let title = json["title"] as? String,
                  let cover = json["cover"] as? String,
                  let id = json["id"] as? Int
            else {
                return nil
            }

        
            self.title = title
            self.cover = cover
            self.id = id
        
        
        }
}
