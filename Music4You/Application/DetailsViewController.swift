//
//  DetailsViewController.swift
//  Music4You
//
//  Created by Mélanie Drevet on 23/02/2021.
//  Copyright © 2021 Mélanie Drevet. All rights reserved.
//

import UIKit
import AVFoundation

class DetailsViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    @IBOutlet weak var musiqueNameLabel: UILabel!
    @IBOutlet weak var musiqueImage: UIImageView!
    @IBOutlet weak var logoApplication: UIImageView!
    @IBOutlet weak var buttonReturn: UIButton!
    
    var musiqueName: String?
    var imageName: String?
    var sonName: String?
    
    override func viewDidLoad() {
           super.viewDidLoad()
            
           logoApplication.image = UIImage(named:"music.png")
           // Do any additional setup after loading the view.
           
           if (musiqueName != nil) && (imageName != nil) {
               self.musiqueNameLabel?.text = musiqueName
               self.musiqueImage?.image = UIImage(named: imageName!)
           }
            
        
    }

    
    
       @IBAction func back() {
            navigationController?.popViewController(animated: true)
       }
       
       @IBAction func play(_ sender: UIButton) {
            player.play()
       }
       @IBAction func pause(_ sender: UIButton) {
            player.pause()
       }
       @IBAction func replay(_ sender: UIButton) {
            player.pause()
            player.currentTime = 0
            player.play()
       }
    
    func configure(_ musiqueName:String, _ imageName:String, _ sonName:String) {
        self.musiqueName = musiqueName
        self.musiqueNameLabel?.text = musiqueName
        self.imageName = imageName
        self.musiqueImage?.image = UIImage(named: imageName)
        self.sonName = sonName
        do {
            let audioPath = Bundle.main.path(forResource: sonName, ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            
        } catch {
            print("ERREUR: Impossible de lire le fichier")
        }
    }
}
