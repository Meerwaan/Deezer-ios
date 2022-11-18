//
//  Track.swift
//  Deezer_IOS
//
//  Created by admin on 16/11/2022.
//

import Foundation

struct Track {

    var name: String
    var preview: String
}


extension Track {
    init?(json: [String: AnyObject]) {
            guard let name = json["title"] as? String,
                let preview = json["preview"] as? String
            else {
                return nil
            }


            self.name = name
            self.preview = preview


        }
}
