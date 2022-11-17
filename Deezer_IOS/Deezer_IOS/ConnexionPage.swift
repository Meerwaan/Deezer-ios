//
//  ConnexionPage.swift
//  Deezer_IOS
//
//  Created by admin on 15/11/2022.
//

import UIKit

class ConnexionPage: UIViewController {
    @IBOutlet weak var EMail: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    
   

    @IBAction func Connexion(_ sender: Any) {
        
        if (self.EMail.text == "admin" && self.Password.text == "admin"){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
                    mainTabBarController.modalPresentationStyle = .fullScreen
                    
                    self.present(mainTabBarController, animated: true, completion: nil)
                }
        }
    }
    
    
    
   


