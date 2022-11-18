//
//  ViewController.swift
//  Deezer_IOS
//
//  Created by Merwan Laouini on 15/11/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.yourFuncHere()
        }



    }
    func yourFuncHere() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let navigation = storyboard.instantiateViewController(identifier: "Navigation")
                navigation.modalPresentationStyle = .fullScreen
                
                self.present(navigation, animated: true, completion: nil)
    }

}
