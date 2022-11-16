//
//  HomeViewController.swift
//  Deezer_IOS
//
//  Created by Merwan Laouini on 15/11/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet  var ArtisteImage: UIImageView!
    
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        image.layer.cornerRadius = image.frame.width/2
        image.layer.masksToBounds = true
    }
    
    

    
    

}
