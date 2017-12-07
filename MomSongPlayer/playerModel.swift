//
//  playerModel.swift
//  MomSongPlayer
//
//  Created by Arsalan Wahid Asghar on 6/15/17.
//  Copyright © 2017 ASGHARS. All rights reserved.
//

import Foundation
import AVFoundation

var audioPlayer = AVAudioPlayer()
var audioloaded = false

struct playerModel{
    //check out filemanager
    //URL
    //absolute String
    
    //Stores the names of the retrieved song names from the getSongNames method
     private lazy var songNames: [String] = []
    
    //Gets all the names of the songs in the app via file manager and get them by URL
    mutating func getSongsNamesFromBundle(){
        
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        do{
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for song in songPath{
                //converts URL to String
                var mySong = song.absoluteString
                if mySong.contains(".mp3"){
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count - 1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with:"")
                    songNames.append(mySong)
                }
            }
        }
        catch{print("Error")}
    }
    
    //Find the audio file load it and then play it
     func getAudioFileAndPlay(theSong Song: String) {
        do{
            let audioPath = Bundle.main.path(forResource: Song, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch{
            print("Could not find mp3 files")
        }
    }
    
    //retuns the names to the view using it
    mutating func getSongNames() -> [String]{
        return songNames
    }
    
    
    func allowPlayBack() {
        let playback = AVAudioSession.sharedInstance()
        do{
            try playback.setCategory(AVAudioSessionCategoryPlayback)
        }
        catch{
            print("Audio Session Could not be made")
        }
    }
    
    
    
}
