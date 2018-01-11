//
//  ViewController.swift
//  Xylophone
//
//  Created by Jake Herman on 1/11/18.
//  Copyright © 2018 Jake Herman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        print(sender.tag)
        switch sender.tag {
        case 1:
            playSound(tag:1)
        case 2:
            playSound(tag:2)
        case 3:
            playSound(tag:3)
        case 4:
            playSound(tag:4)
        case 5:
            playSound(tag:5)
        case 6:
            playSound(tag:6)
        case 7:
            playSound(tag:7)
        default:
            print("error")
        }
    }
    
    
    func playSound(tag:Int) {
        guard let url = Bundle.main.url(forResource: "note\(tag)", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
}
