//
//  SettingsTableViewController.swift
//  InternetRadio
//
//  Created by Jake Hardy on 5/11/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class SettingsTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 2 {
            configureMailView()
        } else if indexPath.row == 1 {
            configureActivityView()
        } else {
            configureSafariView()
        }
    }
    
    func configureMailView() {
        if MFMailComposeViewController.canSendMail() {
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            
            mailComposer.setToRecipients(["jhardy3@live.com"])
            mailComposer.setSubject("Feedback")
            mailComposer.setMessageBody("Feedback: ", isHTML: false)
            
            self.presentViewController(mailComposer, animated: true, completion: nil)
        }
    }
    
    func configureActivityView() {
        
        let activity = UIActivityViewController(activityItems: [], applicationActivities: [])
        
        self.presentViewController(activity, animated: true, completion: nil)
        
    }
    
    func configureSafariView() {
        guard let url = NSURL(string: "Http://Apple.com") else { return }
        let svc = SFSafariViewController(URL: url)
        
        self.presentViewController(svc, animated: true, completion: nil)
    }

}
