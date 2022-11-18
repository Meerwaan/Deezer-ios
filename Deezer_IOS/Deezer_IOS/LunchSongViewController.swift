//
//  LunchSongViewController.swift
//  Deezer_IOS
//
//  Created by admin on 17/11/2022.
//

import UIKit
import AVFoundation

class LunchSongViewController: UIViewController {
    
    var preview: String = ""
    var albumImage : String = ""
    var Title: String = ""
    var NameArtist: String = ""
    
    
    
    @IBOutlet weak var SongCover: UIImageView!
    var audioPlayer: AVPlayer?
    
    var size:CGFloat = 50
    
    @IBOutlet weak var SongName: UILabel!
    @IBOutlet weak var ArtistName: UILabel!
    @IBOutlet weak var Playbutton: UIButton!
    @IBOutlet weak var SliderVolume: UISlider!
    
    let config = UIImage.SymbolConfiguration(pointSize: 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: preview) else {
            print("error to get the mp3 file")
            return
        }
    

        audioPlayer = AVPlayer(url: url as URL)
        
        Playbutton.setImage(UIImage(systemName: "pause.fill", withConfiguration: config)?.withTintColor(.white, renderingMode: UIImage.RenderingMode.alwaysOriginal), for: UIControl.State.normal)
        
        audioPlayer!.play()
        self.SongCover.downloaded(from: self.albumImage)
        self.ArtistName.text = self.NameArtist
        self.SongName.text = self.Title
        
        
        
    }
    
    
    @IBAction func TapToBack(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        mainTabBarController.modalPresentationStyle = .fullScreen
        
        self.present(mainTabBarController, animated: true, completion: nil)
    }
    
    @IBAction func playTrack(_ sender: UIButton) {
        
        if self.audioPlayer?.rate == 0
            {
            self.audioPlayer!.play()
            Playbutton.setImage(UIImage(systemName: "pause.fill", withConfiguration: config)?.withTintColor(.white, renderingMode: UIImage.RenderingMode.alwaysOriginal), for: UIControl.State.normal)
            } else {
                self.audioPlayer!.pause()
                Playbutton.setImage(UIImage(systemName: "play.fill", withConfiguration: config)?.withTintColor(.white, renderingMode: UIImage.RenderingMode.alwaysOriginal), for: UIControl.State.normal)
            }
    
    }
    
    
    
    
    
    @IBAction func ChangeVol(_ sender: UISlider) {
    
        }

    
}



