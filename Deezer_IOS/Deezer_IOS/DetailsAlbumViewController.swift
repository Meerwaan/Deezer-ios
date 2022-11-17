//
//  DetailsAlbumViewController.swift
//  Deezer_IOS
//
//  Created by admin on 17/11/2022.
//

import UIKit

class DetailsAlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var AlbumCover: UIImageView!
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
        print(self.DetailsAlbum[indexPath.row].title)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.NomArtist.text = self.DetailsAlbum[indexPath.row].artistName
        self.TitreAlbum.text = self.DetailsAlbum[indexPath.row].albumName
        self.AlbumCover = UIImageView(image: ApiManager.shared.getImageFromUrl(urlStr:self.DetailsAlbum[indexPath.row].albumImage )) 
        let DetailsAlbumCell = DetailsAlbumTableView.dequeueReusableCell(withIdentifier: "DetailsAlbumCell", for: indexPath)
        
        DetailsAlbumCell.textLabel?.text = self.DetailsAlbum[indexPath.row].title
        
        return DetailsAlbumCell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
