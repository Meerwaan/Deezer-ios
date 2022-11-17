//
//  DetailsArtistViewController.swift
//  Deezer_IOS
//
//  Created by admin on 17/11/2022.
//

import UIKit

class DetailsArtistViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var NameArtist: UILabel!

    @IBOutlet weak var ArtistTableView: UITableView!
    @IBOutlet weak var ImageArtist: UIImageView!
    var albums:[Album] = []
    var id:Int = 0
    var name:String = ""
    var image:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        ArtistTableView.dataSource = self
        ArtistTableView.delegate = self
        
       
        ApiManager.shared.fetchAlbumsFromArtistId(id: id, completionHandler: {data,error in
            self.albums = data
            print(data)
            DispatchQueue.main.async {
                self.ArtistTableView.reloadData()
            }
        })
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.albums.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailsAlbum = storyboard?.instantiateViewController(identifier: "DetailsAlbum") as! DetailsAlbumViewController
        DetailsAlbum.modalPresentationStyle = .fullScreen
        DetailsAlbum.id = self.albums[indexPath.row].id
        present(DetailsAlbum,animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.NameArtist.text = self.name
        self.ImageArtist.downloaded(from: self.image)
        let ArtistCell = ArtistTableView.dequeueReusableCell(withIdentifier: "ArtistCell", for: indexPath)
        
        ArtistCell.textLabel?.text = self.albums[indexPath.row].title
        ArtistCell.textLabel?.textColor = UIColor.white
        
        return ArtistCell
    }
    

}
