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
    
    let timeZoneAbbreviation = DateStandardizer.returnAcronym()
    
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
        cell.hostDetailLabel.text = "Weekdays, \(show.startTimeStandardized.returnTimeString()) to  \(show.endTimeStandardized.returnTimeString()) \(timeZoneAbbreviation)"
        
        if StationController.sharedController.showIsValid(show) {
            cell.onAirLabel.hidden = false
            cell.hostNameLabel.textColor = UIColor.blackColor()
        } else {
            cell.hostNameLabel.textColor = UIColor.grayColor()
            cell.onAirLabel.hidden = true
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let show = StationController.sharedController.shows[indexPath.row]
        if StationController.sharedController.showIsValid(show) {
            StationController.sharedController.showSelected(show)
            performSegueWithIdentifier("toDetail", sender: tableView.cellForRowAtIndexPath(indexPath))
        } else {
            createAlertWithShow(show)
        }
    }
    
    func createAlertWithShow(show: Show) {
        let startTime = show.startTimeStandardized
        let endTime = show.endTimeStandardized
        let host = show.hostName
        
        var weekdays = "weekdays"
        if show.weekend {
            weekdays = "weekends"
        }
        
        let messageString = "\(host) is available \n \(weekdays) from \(startTime) to \(endTime), \n Please check back at that time."
        
        let alertController = UIAlertController(title: "Show currently not broadcasting", message: messageString, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}

