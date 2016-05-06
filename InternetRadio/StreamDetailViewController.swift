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


class StreamDetailViewController: UIViewController {
    
    @IBOutlet weak var streamProgressBar: UIProgressView!
    @IBOutlet weak var streamDetailLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    
    var show: Show?
    var station: Station?
    var viewMode = ViewMode.Show

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
        streamDetailLabel.text = station.stationName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    @IBAction func togglePlayButtonTapped(sender: UIButton) {
    }
    
    @IBAction func sleepButtonTapped(sender: UIButton) {
    }
    
}
