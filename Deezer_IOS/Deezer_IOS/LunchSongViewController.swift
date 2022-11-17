//
//  LunchSongViewController.swift
//  Deezer_IOS
//
//  Created by admin on 17/11/2022.
//

import UIKit

class LunchSongViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func TapToBack(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
                mainTabBarController.modalPresentationStyle = .fullScreen
                
                self.present(mainTabBarController, animated: true, completion: nil)
    }
    
    

}
