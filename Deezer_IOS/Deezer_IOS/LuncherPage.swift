//
//  LuncherPage.swift
//  Deezer_IOS
//
//  Created by admin on 15/11/2022.
//

import UIKit

class LuncherPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
     @IBAction func TapToSignUp(_ sender: Any) {
         let inscriptionView = storyboard?.instantiateViewController(identifier: "Inscription") as! InscriptionPage
         inscriptionView.modalPresentationStyle = .fullScreen
         present(inscriptionView,animated: true)
     }

    @IBAction func TapToSignIn(_ sender: Any) {
        let ConnexionView = storyboard?.instantiateViewController(identifier: "Connexion") as! ConnexionPage
        ConnexionView.modalPresentationStyle = .fullScreen
        present(ConnexionView,animated: true)
    }
}
