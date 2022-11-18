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
        let LunchPage = storyboard?.instantiateViewController(identifier: "LuncherPage") as!LuncherPage;        LunchPage.modalPresentationStyle = .fullScreen
        present(LunchPage,animated: true)
    }

}
