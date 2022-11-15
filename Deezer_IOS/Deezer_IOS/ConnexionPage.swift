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
    @IBOutlet weak var HiddenText: UILabel!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    
    @IBAction func TapToChangeColor(_ sender: Any) {
        self.HiddenText.sizeToFit()
        if (self.EMail.text == "admin" && self.Password.text == "admin" ){
            self.HiddenText.text = "Connexion Réussi"
        }else
        {
            self.HiddenText.text = "Mot de passe Incorrect"
        }

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
