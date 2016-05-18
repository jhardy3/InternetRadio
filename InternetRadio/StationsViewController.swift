//
//  StationsViewController.swift
//  InternetRadio
//
//  Created by Jake Hardy on 4/30/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import UIKit

class StationsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // Current implementation uses current and last index to distinguish if stream
    // Must be reloaded
    var currentIndex: Int?
    var lastIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let destination = segue.destinationViewController as?StreamDetailViewController else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath = tableView.indexPathForCell(cell) else { return }
        destination.viewMode = ViewMode.Station
        destination.station = StationController.sharedController.stations[indexPath.row]
    }
    
}

extension StationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return StationController.sharedController.stations.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stationCell", forIndexPath: indexPath) as! StationTableViewCell
        let station = StationController.sharedController.stations[indexPath.row]
        
        cell.stationNameLabel.text = station.stationName
        cell.stationDetailLabel.text = station.stationDetail
        cell.stationImageView.image = station.stationImage
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let station = StationController.sharedController.stations[indexPath.row]
        lastIndex = currentIndex
        currentIndex = indexPath.row
        if lastIndex == currentIndex && globalState == .Stations {
            
        } else {
            StationController.sharedController.stationSelected(station)
        }
        globalState = .Stations
    }
    
}
