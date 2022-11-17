//
//  DetailsAlbumViewController.swift
//  Deezer_IOS
//
//  Created by admin on 17/11/2022.
//

import UIKit

class DetailsAlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet  var AlbumCover: UIImageView!
    @IBOutlet weak var NomArtist: UILabel!
    var DetailsAlbum:[Song] = []
    @IBOutlet weak var TitreAlbum: UILabel!
    @IBOutlet weak var DetailsAlbumTableView: UITableView!
    
    var id: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailsAlbumTableView.dataSource = self
        DetailsAlbumTableView.delegate = self
        
       
        ApiManager.shared.fetchTracksFromAlbumId(id: id, completionHandler: {data,error in
            self.DetailsAlbum = data
            DispatchQueue.main.async {
                self.DetailsAlbumTableView.reloadData()
            }
        })
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.DetailsAlbum.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let LunchSong = storyboard?.instantiateViewController(identifier: "LunchSong") as! LunchSongViewController
        LunchSong.modalPresentationStyle = .fullScreen
        present(LunchSong,animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.NomArtist.text = self.DetailsAlbum[indexPath.row].artistName
        self.TitreAlbum.text = self.DetailsAlbum[indexPath.row].albumName
        self.AlbumCover.downloaded(from: self.DetailsAlbum[indexPath.row].albumImage)
        let DetailsAlbumCell = DetailsAlbumTableView.dequeueReusableCell(withIdentifier: "DetailsAlbumCell", for: indexPath)
        
        DetailsAlbumCell.textLabel?.text = self.DetailsAlbum[indexPath.row].title
        DetailsAlbumCell.textLabel?.textColor = UIColor.white
        
        return DetailsAlbumCell
    }
    

  

}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


