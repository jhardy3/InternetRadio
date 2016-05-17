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
    
//    @IBOutlet weak var pauseButtonYConstraint: NSLayoutConstraint!
    @IBOutlet weak var streamProgressBar: UIProgressView!
    @IBOutlet weak var streamDetailLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var togglePlayButton: UIButton!
    @IBOutlet weak var listeningTimeLabel: UILabel!
    
    var show: Show?
    var station: Station?
    var viewMode = ViewMode.Show
    var playState = PlayState.Streaming
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

//        pauseButtonYConstraint.constant = (self.view.frame.height / 30)
        
        
        timer.delegate = self
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
        listeningTimeLabel.text = show.showStation
        timer.startTimer()
    }
    
    func updateWithStation(station: Station) {
        streamProgressBar.progress = 1.0
        streamDetailLabel.text = station.stationName
        listeningTimeLabel.text = station.stationDetail
        detailImageView.image = station.stationImage
        timer.startTimer()
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
            timer.stopTimer()
        case .Paused:
            playState = .Streaming
            StationController.sharedController.stationStarted()
            togglePlayButton.setImage(UIImage(named: "Pause"), forState: .Normal)
            timer.startTimer()
        }
    }
    
    @IBAction func volumeSliderFired(sender: UISlider) {
        StationController.sharedController.audioVolumeChanged(sender.value)
    }
    
}

extension StreamDetailViewController: TimerDelegate {
    
    func updatedTimeString(time: String) {
//        self.listeningTimeLabel.text = time
    }
    
}
