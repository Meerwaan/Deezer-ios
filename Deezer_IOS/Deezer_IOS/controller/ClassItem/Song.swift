//
//  Song.swift
//  Deezer_IOS
//
//  Created by admin on 17/11/2022.
//

import Foundation

struct Song {
    var preview: String
    var title: String
    var artistName: String
    var albumImage: String
    var albumName: String
}
extension Song{
    init?(json: [String: AnyObject]) {
            guard
                let preview = json["preview"] as? String,
                let title = json["title"] as? String,
                let artistName = json["artistName"] as? String,
                let  albumImage = json[" albumImage"] as? String,
                let albumName = json["albumName"] as? String
            else {
                return nil
            }

            self.preview = preview
            self.title = title
            self.artistName = artistName
            self.albumImage = albumImage
            self.albumName =  albumName
        
        
        }
}
