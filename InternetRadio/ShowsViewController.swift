//
//  ShowsViewController.swift
//  InternetRadio
//
//  Created by Jake Hardy on 5/2/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import UIKit

class ShowsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let destination = segue.destinationViewController as?StreamDetailViewController else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath = tableView.indexPathForCell(cell) else { return }
        destination.viewMode = ViewMode.Show
        destination.show = StationController.sharedController.shows[indexPath.row]
    }

}

extension ShowsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return StationController.sharedController.shows.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("showCell", forIndexPath: indexPath) as! ShowTableViewCell
        let show = StationController.sharedController.shows[indexPath.row]
        
        cell.hostImageView.image = show.hostImage
        cell.hostNameLabel.text = show.hostName
        
        if StationController.sharedController.showIsValid(show) {
            cell.hostDetailLabel.text = "ON AIR"
            cell.hostDetailLabel.textColor = UIColor.redColor()
            cell.userInteractionEnabled = true
        } else {
            cell.hostDetailLabel.textColor = UIColor.blackColor()
            cell.hostDetailLabel.text = "Weekdays, \(show.startTime) GMT to \(show.endTime) GMT"
            cell.userInteractionEnabled = false
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let show = StationController.sharedController.shows[indexPath.row]
        StationController.sharedController.showSelected(show)
    }
    
}

