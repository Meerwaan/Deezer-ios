//
//  ListArtistsPage.swift
//  Deezer_IOS
//
//  Created by Fayssal Mechmeche on 16/11/2022.
//

import UIKit

class ListArtistsPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var ListArtistPageView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ListArtistPageView.delegate = self
        ListArtistPageView.dataSource = self
        
        ApiManager.shared.getArtist { data in
            print(data)
            self.artists = data
            DispatchQueue.main.async {
                self.ListArtistPageView.reloadData()
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.artists.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.artists[indexPath.row].name)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ListArtisteCell = ListArtistPageView.dequeueReusableCell(withIdentifier: "ListArtisteCell", for: indexPath)
        
        ListArtisteCell.textLabel?.text = self.artists[indexPath.row].name
        
        return ListArtisteCell
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
