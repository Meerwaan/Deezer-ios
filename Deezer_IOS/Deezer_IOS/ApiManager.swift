//
//  ApiManager.swift
//  Deezer_IOS
//
//  Created by Merwan Laouini on 15/11/2022.
//
import UIKit

class ApiManager {
    
   static let shared = ApiManager()

    private init(){
        
    }
    
    func getAlbum(completionHanlder: @escaping (_ data: [String]) -> Void) {
        var albums:[String] = []
        
        let config = URLSessionConfiguration.default
                let session = URLSession(configuration: config)
                
                let url = URL(string: "https://api.deezer.com/chart/0/albums")!
                
                let task = session.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                            if let data = json as? [String: AnyObject] {
                                
                                if let items = data["data"] as? [[String: AnyObject]] {
                                    for item in items {
                                        //print(item["link"]!)
                                        albums.append(item["title"]! as! String)
                                        /* if let artist = Artist(json: item) {
                                            self.album.append(artist)
                                        }*/
                                        
                                    }
                                    
                                    completionHanlder(albums)
                                }
                            }
                        }
                    }
                    
                 
                    
                }
                task.resume()
        
        
        
        
        
        
    }
    
    
}
    


   
