//
//  ShowsViewController.swift
//  InternetRadio
//
//  Created by Jake Hardy on 5/2/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import UIKit
import StoreKit

enum ViewState {
    case Shows
    case Stations
}

var globalState = ViewState.Shows

class ShowsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var currentIndex: Int?
    var lastIndex: Int?
    
    let timeZoneAbbreviation = DateStandardizer.returnAcronym()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        StationController.sharedController.sortShows()
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
        lastIndex = currentIndex
        currentIndex = indexPath.row
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let show = StationController.sharedController.shows[indexPath.row]
        
        if currentIndex == lastIndex && globalState == ViewState.Shows {
            performSegueWithIdentifier("toDetail", sender: tableView.cellForRowAtIndexPath(indexPath))
        } else if StationController.sharedController.showIsValid(show) {
            StationController.sharedController.showSelected(show)
            performSegueWithIdentifier("toDetail", sender: tableView.cellForRowAtIndexPath(indexPath))
        } else {
            createAlertWithShow(show)
        }
        globalState = .Shows
    }
    
    func createAlertWithShow(show: Show) {
        let startTime = show.startTimeStandardized
        let endTime = show.endTimeStandardized
        let host = show.hostName
        
        var weekdays = "weekdays"
        if show.weekend {
            weekdays = "weekends"
        }
        
        let messageString = "\(host) is available \n \(weekdays) from \(startTime.returnTimeString()) to \(endTime.returnTimeString()) \(DateStandardizer.returnAcronym()), \n Please check back at that time."
        
        let alertController = UIAlertController(title: "Show currently not broadcasting", message: messageString, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}

extension ShowsViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    
    func fetchProducts(){
        print("About to fetch the products");
        // We check that we are allow to make the purchase.
        if (SKPaymentQueue.canMakePayments())
        {
            let productID = NSSet(object: productIDOne);
            let productsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>);
            productsRequest.delegate = self;
            productsRequest.start();
            print("Fething Products");
        }else{
            print("can't make purchases");
        }
    }
    
    
    // Helper Methods
    
    func buyProduct(product: SKProduct){
        print("Sending the Payment Request to Apple");
        let payment = SKPayment(product: product)
        SKPaymentQueue.defaultQueue().addPayment(payment);
        
    }
    
    // Delegate Methods for IAP
    
    func productsRequest (request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        print("got the request from Apple")
        let count = response.products.count
        if (count>0) {
            
            let validProduct = response.products[0] as SKProduct
            if (validProduct.productIdentifier == productIDOne) {
                print(validProduct.localizedTitle)
                print(validProduct.localizedDescription)
                print(validProduct.price)
                buyProduct(validProduct);
            } else {
                print(validProduct.productIdentifier)
            }
        } else {
            print("nothing")
        }
    }
    
    
    @objc func request(request: SKRequest, didFailWithError error: NSError) {
        print("La vaina fallo");
    }
    
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction])    {
        print("Received Payment Transaction Response from Apple");
        
        for transaction : AnyObject in transactions {
            if let trans:SKPaymentTransaction = transaction as? SKPaymentTransaction{
                switch trans.transactionState {
                case .Purchased:
                    print("Product Purchased");
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction as! SKPaymentTransaction)
                    break;
                case .Failed:
                    print("Purchased Failed");
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction as! SKPaymentTransaction)
                    break;
                case .Restored:
                    SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
                default:
                    break;
                }
            }
        }
        
    }
}

