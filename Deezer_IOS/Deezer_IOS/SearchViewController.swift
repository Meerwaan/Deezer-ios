//
//  SearchViewController.swift
//  Deezer_IOS
//
//  Created by admin on 17/11/2022.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,  UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var artist:[Artist] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SearchTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != "" {
            ApiManager.shared.fetchArtists(searchText: searchText, completionHandler: {data,error in
                self.artist = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.artist.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artist = storyboard?.instantiateViewController(identifier: "DetailsArtist") as! DetailsArtistViewController
        artist.modalPresentationStyle = .fullScreen
        artist.id = self.artist[indexPath.row].id
        artist.name = self.artist[indexPath.row].name
        artist.image = self.artist[indexPath.row].picture
        present(artist,animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        Cell.NameArtist.text = self.artist[indexPath.row].name
        Cell.ImageArtist.downloaded(from: self.artist[indexPath.row].picture)
        return Cell
    }
    

}


