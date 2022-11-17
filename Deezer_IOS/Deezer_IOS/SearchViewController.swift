//
//  SearchViewController.swift
//  Deezer_IOS
//
//  Created by Merwan Laouini on 16/11/2022.
//

import UIKit

class SearchViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    var artist:[Artist] = []
    @IBOutlet weak var SearchTableView: UITableView!
    @IBOutlet weak var Search: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        SearchTableView.dataSource = self
        SearchTableView.delegate = self
    }
    

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.artist.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let DetailsAlbum = storyboard?.instantiateViewController(identifier: "DetailsAlbum") as! DetailsAlbumViewController
        DetailsAlbum.modalPresentationStyle = .fullScreen
        DetailsAlbum.id = self.artist[indexPath.row].id
        present(DetailsAlbum,animated: true)*/
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let SearchCell = SearchTableView.dequeueReusableCell(withIdentifier: "ArtisteCell", for: indexPath)
        
        SearchCell.textLabel?.text = self.artist[indexPath.row].name
        
        return SearchCell
    }
    
}
