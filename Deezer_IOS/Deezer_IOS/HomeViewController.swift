//
//  HomeViewController.swift
//  Deezer_IOS
//
//  Created by Merwan Laouini on 15/11/2022.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    var albums:[Album] = []
    
    @IBOutlet weak var ArtisteTableView: UITableView!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        ArtisteTableView.dataSource = self
        ArtisteTableView.delegate = self
        
        // Do any additional setup after loading the view.
        // allo
        
        ApiManager.shared.fetchAllAlbums { data in
            
            self.albums = data
            DispatchQueue.main.async {
                self.ArtisteTableView.reloadData()
            }
        }
        
    }
    
    
    @IBAction func tapToList(_ sender: Any) {
        let ListArtist = storyboard?.instantiateViewController(identifier: "ListArtistPage") as! ListArtistsPage
        ListArtist.modalPresentationStyle = .fullScreen
        present(ListArtist,animated: true)
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
        let ArtisteCell = ArtisteTableView.dequeueReusableCell(withIdentifier: "ArtisteCell", for: indexPath)
        
        ArtisteCell.textLabel?.text = self.albums[indexPath.row].title
        
        return ArtisteCell
    }
    
}
