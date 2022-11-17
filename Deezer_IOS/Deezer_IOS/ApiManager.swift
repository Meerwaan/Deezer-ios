//
//  ApiManager.swift
//  onzer
//
//  Created by Merwan Laouini on 05/04/2022.
//

import Foundation
import UIKit

class ApiManager {
    static let shared = ApiManager()
    let baseURL = "https://api.deezer.com/"
    var urlAlbum = "album/302127"
    var artistsArray = [Artist]()
    var albumsArray = [Album]()
    
    
    
   
    
    func fetchTracksFromArtists(searchText: String ,completion: @escaping (_ data : [Song], _ error: Error?) -> Void){
        var tracksArray = [Song]()
        let strUrl = "\(baseURL)search?q=" + searchText
        let url = URL(string: strUrl)!
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        let trueData = data["data"] as? [[String:AnyObject]]
                        //print(trueData)
                        for item in trueData! {
                            let preview = item["preview"] as? String
                            let title = item["title"] as? String
                            let artistName = item["artist"]?["name"] as? String
                            let albumImage = item["album"]?["cover"] as? String
                            let albumName = item["album"]?["title"] as? String
                            
                            let song = Song(preview: preview!, title: title!, artistName: artistName!, albumImage: albumImage!, albumName: albumName!)
                            tracksArray.append(song)
                        }
                        //print(artistsArray)
                        completion(tracksArray, error)
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchArtists(searchText:String ,completionHandler: @escaping (_ data : [Artist], _ error: Error?) -> Void){
        let strUrl = "\(baseURL)search/artist?q=" + searchText
        let url = URL(string: strUrl)!
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        let trueData = data["data"] as? [[String:AnyObject]]
                        //print(trueData)
                        for item in trueData! {
                            let name = item["name"] as? String
                            let id = item["id"] as? Int
                            let picture = item["picture"] as? String
                            
                            
                            let artiste = Artist(id: id! , name: name!, picture: picture!)
                            //print(artist)
                            self.artistsArray.append(artiste)
                        }
                        completionHandler(self.artistsArray, error) //print(artistsArray)
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchAlbumsFromArtistId(id: Int,completionHandler: @escaping (_ data : [Album], _ error: Error?) -> Void) -> Void {
        
        var albumsArray = [Album]()
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let strUrl = "\(baseURL)artist/\(id)/albums"
        let url = URL(string: strUrl)!
        
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        let trueData = data["data"] as? [[String:AnyObject]]
                        for item in trueData! {
                            
                            let title = item["title"] as? String
                            let cover = item["cover"] as? String
                            let id = item["id"] as? Int
                            let myAlbum = Album( id: id!, title: title!, cover: cover!)
                            albumsArray.append(myAlbum)
                        }
                        completionHandler(albumsArray, error)
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    
    func fetchTracksFromAlbumId(id:Int, completionHandler: @escaping (_ data : [Song], _ error: Error?) -> Void) -> Void {
        var tracksArray = [Song]()
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let strUrl = "\(baseURL)album/\(id)"
        let url = URL(string: strUrl)!
        
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        if let tracks = data["tracks"] as? [String:AnyObject] {
                            if let tracksData = tracks["data"] as? [[String:AnyObject]]{
                                for item in tracksData {
                                    let preview = item["preview"] as? String
                                    let title = item["title"] as? String
                                    let artistName = item["artist"]?["name"] as? String
                                    
                                    let song = Song(preview: preview!, title: title!, artistName: artistName!, albumImage: data["cover"] as! String, albumName: data["title"] as! String)
                                    tracksArray.append(song)
                                    
                                }
                            }
                        }
                        
                        completionHandler(tracksArray, error)
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchAllArtists(completionHandler: @escaping (_ data: [Artist]) -> Void){
        let strUrl = "\(baseURL)chart/0/artists"
        let url = URL(string: strUrl)!
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        let trueData = data["data"] as? [[String:AnyObject]]
                        //print(trueData)
                        for item in trueData! {
                            let name = item["name"] as? String
                            let id = item["id"] as? Int
                            let picture = item["picture"] as? String
                            
                            
                            let artiste = Artist(id: id! , name: name!, picture: picture!)
                            print(artiste)
                            self.artistsArray.append(artiste)
                        }
                        completionHandler(self.artistsArray)
                        
                    }
                }
            }
            
        }
        task.resume()
    }
    func fetchAllAlbums(completionHanlder: @escaping (_ data: [Album]) -> Void){
        let strUrl = "\(baseURL)chart/0/albums"
        let url = URL(string: strUrl)!
        let config = URLSessionConfiguration.default
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        let trueData = data["data"] as? [[String:AnyObject]]
                        //print(trueData)
                        for item in trueData! {
                            let title = item["title"] as? String
                            let id = item["id"] as? Int
                            let cover = item["cover"] as? String
                            
                            
                            let album = Album(id: id!, title: title!, cover: cover!)
                            
                            self.albumsArray.append(album)
                        }
                        completionHanlder(self.albumsArray)
                        
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    
    
    
    
   
}
