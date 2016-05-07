//
//  StreamDetailViewController.swift
//  InternetRadio
//
//  Created by Jake Hardy on 5/2/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import UIKit

enum ViewMode {
    case Show
    case Station
}

enum PlayState {
    case Paused
    case Streaming
}


class StreamDetailViewController: UIViewController {
    
    @IBOutlet weak var streamProgressBar: UIProgressView!
    @IBOutlet weak var streamDetailLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var togglePlayButton: UIButton!
    
    var show: Show?
    var station: Station?
    var viewMode = ViewMode.Show
    var playState = PlayState.Streaming

    override func viewDidLoad() {
        super.viewDidLoad()

        streamDetailLabel.adjustsFontSizeToFitWidth = true
        
        if let show = show where viewMode == .Show {
            updateWithShow(show)
        } else if let station = station where viewMode == .Station {
            updateWithStation(station)
        }
        
    }
    
    func updateWithShow(show: Show) {
        self.streamDetailLabel.text = show.hostName
        self.detailImageView.image = show.hostImage
    }
    
    func updateWithStation(station: Station) {
        streamProgressBar.progress = 1.0
        streamDetailLabel.text = station.stationName
        detailImageView.image = station.stationImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    @IBAction func togglePlayButtonTapped(sender: UIButton) {
        switch playState {
        case .Streaming:
            playState = .Paused
            StationController.sharedController.stationPaused()
            togglePlayButton.setImage(UIImage(named: "Play"), forState: .Normal)
        case .Paused:
            playState = .Streaming
            StationController.sharedController.stationStarted()
            togglePlayButton.setImage(UIImage(named: "Pause"), forState: .Normal)
        }
    }
    
    @IBAction func volumeSliderFired(sender: UISlider) {
        StationController.sharedController.audioVolumeChanged(sender.value)
    }
    
}
