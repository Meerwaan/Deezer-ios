//
//  ApiManager.swift
//  Deezer_IOS
//
//  Created by Merwan Laouini on 15/11/2022.
//
import Foundation
import UIKit

class ApiManager {
    
    let ApiUrl = "http://api.deezer.com"
    let AlbumUrl = "/album/27"
    
    
    
    
    func getAlbum(completionHandler: @escaping ([Album])) -> Void {
        let url = URL(string: ApiUrl+AlbumUrl)!
        var albumArray = [Album]()
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error) in
            if let error = error{
                print("erreur de fetching \(error)")
                return
            }
        }
    }
    
    struct Album {
        var id: Int
        var name: String
        var cover: String
    }

    struct Artist {
        var id: Int
        var name: String
        var picture: String
    }

    struct Song {
        var preview: String
        var title: String
        var artistName: String
        var albumImage: String
        var albumName: String
    }

}
