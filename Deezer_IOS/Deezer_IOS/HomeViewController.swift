//
//  HomeViewController.swift
//  Deezer_IOS
//
//  Created by Merwan Laouini on 15/11/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet  var ArtisteImage: UIImageView!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func tapToList(_ sender: Any) {
        let ListArtist = storyboard?.instantiateViewController(identifier: "ListArtistPage") as! ListArtistsPage
        ListArtist.modalPresentationStyle = .fullScreen
        present(ListArtist,animated: true)
    }
    
    
    

}
