//
//  FirstViewController.swift
//  MomSongPlayer
//
//  Created by Arsalan Wahid Asghar on 6/15/17.
//  Copyright © 2017 ASGHARS. All rights reserved.
//

import UIKit
import AVFoundation

var mySongs : [String] = []     //Stores the songs names found from model
var thisSong = 0                //updates which row is going to be played or being played

class FirstViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {


    @IBOutlet weak var table: UITableView!
    lazy var findSongs = playerModel()
    
    
    override func viewDidLoad() {
        findSongs.getSongsNamesFromBundle()
        mySongs = findSongs.getSongNames()
        table.reloadData()
        findSongs.allowPlayBack() // will allow sound to be played in the background
        tabBarItem.selectedImage = UIImage(named: "song")!.withRenderingMode(.alwaysOriginal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySongs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = mySongs[indexPath.row]
        return cell
    }
    
    //print the item selected !!! Great
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        findSongs.getAudioFileAndPlay(theSong:  mySongs[indexPath.row])
        audioloaded = true
        thisSong = indexPath.row  //updates which row is being played


    }
    

}

