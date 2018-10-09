//
//  SecondViewController.swift
//  MomSongPlayer
//
//  Created by Arsalan Wahid Asghar on 6/15/17.
//  Copyright © 2017 ASGHARS. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{


    //MARK:- Outlets
    @IBOutlet weak var songName: UILabel!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = UIImage(named: "play")!.withRenderingMode(.alwaysOriginal)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        songName.text = mySongs[thisSong]
    }

    //MARK:- Actions
    @IBAction func play(_ sender: UIButton) {
        
        if (audioloaded == true && audioPlayer.isPlaying == false){
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        
        if (audioloaded == true && audioPlayer.isPlaying) {
            audioPlayer.pause()
        }
    }
    
    @IBAction func prev(_ sender: UIButton) {
        let audioPlayer = playerModel()
        if thisSong == 0{
            //dont decrement
        }else {
            if audioloaded == true{
                audioPlayer.getAudioFileAndPlay(theSong: mySongs[thisSong - 1])
                thisSong -= 1
                songName.text = mySongs[thisSong]
            }
        }
    }
    @IBAction func next(_ sender: UIButton) {
        
        var audioPlayer = playerModel()
        if thisSong == mySongs.count - 1{
            //dont increment
        }else{
            if audioloaded == true {
            audioPlayer.getAudioFileAndPlay(theSong: mySongs[thisSong + 1])
            thisSong += 1
            songName.text = mySongs[thisSong]
            }
        }
    }
    
    
    @IBAction func musicVolume(_ sender: UISlider) {
        if audioloaded == true{
        audioPlayer.volume = sender.value
        }
    }
}

