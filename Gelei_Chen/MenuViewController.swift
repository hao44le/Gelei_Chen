//
//  MenuViewController.swift
//  Gelei_Chen
//
//  Created by Gelei Chen on 15/4/24.
//  Copyright (c) 2015 Geilei_Chen. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var callOther: UIButton!{
        didSet{
            callOther.transform = CGAffineTransformMakeRotation(CGFloat(45.0*M_PI/180.0))
        }
    }
    
    @IBAction func callOtherClicked(sender: UIButton) {
        switch index {
        case 0:
            let alertController = UIAlertController(title: nil, message: "Know more about Purdue App", preferredStyle: .ActionSheet)
            
            
            
            let goAction = UIAlertAction(title: "Go to App Store", style: .Default) { (action) in
                UIApplication.sharedApplication().openURL(NSURL(string: "https://itunes.apple.com/us/app/purdue-app/id964519976?mt=8")!)
            }
            
            alertController.addAction(goAction)
            
            let OKAction = UIAlertAction(title: "Purdue App Demo Video", style: .Default) { (action) in
                UIApplication.sharedApplication().openURL(NSURL(string: "https://www.facebook.com/PurdueApp/videos/vb.1544599972460604/1545495552371046/?type=2&theater")!)
                
            }
            alertController.addAction(OKAction)
            
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                
                
            }
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }
            
            alertController.view.tintColor = UIColor.blackColor()
        case 1:
            let alertController = UIAlertController(title: nil, message: "Know more about Quest Board", preferredStyle: .ActionSheet)
            
            
            
            let goAction = UIAlertAction(title: "Go to ChallengePost", style: .Default) { (action) in
                UIApplication.sharedApplication().openURL(NSURL(string: "http://challengepost.com/software/questboard")!)
            }
            
            alertController.addAction(goAction)
            
            let OKAction = UIAlertAction(title: "The Group Photo", style: .Default) { (action) in
                UIApplication.sharedApplication().openURL(NSURL(string: "https://drive.google.com/file/d/0BzSMfqxlsM0wU1JRc0YtVFZ0VGc/view?usp=sharing")!)
                
            }
            alertController.addAction(OKAction)
            
            let detailAction = UIAlertAction(title: "QuestBoard Detail", style: .Default) { (action) in
                UIApplication.sharedApplication().openURL(NSURL(string: "https://www.flickr.com/photos/131990520@N05/sets/72157652171025041/")!)
                
            }
            alertController.addAction(detailAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                
                
            }
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }
            
            alertController.view.tintColor = UIColor.blackColor()
            
        case 2:
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.flickr.com/photos/131990520@N05/sets/72157651764366450/")!)
        case 3:
            let alertController = UIAlertController(title: nil, message: "Know more about DBFM", preferredStyle: .ActionSheet)
            
            
            
            let goAction = UIAlertAction(title: "DBFM detail", style: .Default) { (action) in
                UIApplication.sharedApplication().openURL(NSURL(string: "https://www.flickr.com/photos/131990520@N05/sets/72157651759446249/")!)
            }
            
            alertController.addAction(goAction)
            
            let OKAction = UIAlertAction(title: "DBFM code", style: .Default) { (action) in
                UIApplication.sharedApplication().openURL(NSURL(string: "https://github.com/hao44le/DBFM")!)
                
            }
            alertController.addAction(OKAction)
            
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                
                
            }
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }
            
            alertController.view.tintColor = UIColor.blackColor()
        case 4:
            let alertController = UIAlertController(title: nil, message: "Know more about ZombieConga", preferredStyle: .ActionSheet)
            
            
            
            let goAction = UIAlertAction(title: "ZombieConga detail", style: .Default) { (action) in
                UIApplication.sharedApplication().openURL(NSURL(string: "https://www.flickr.com/photos/131990520@N05/sets/72157652171055281/")!)
            }
            
            alertController.addAction(goAction)
            
            let OKAction = UIAlertAction(title: "ZombieConga code", style: .Default) { (action) in
                UIApplication.sharedApplication().openURL(NSURL(string: "https://github.com/hao44le/ZombieConga")!)
                
            }
            alertController.addAction(OKAction)
            
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                
                
            }
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }
            
            alertController.view.tintColor = UIColor.blackColor()
        case 5:
            let alertController = UIAlertController(title: nil, message: "Know more about watchKit Tutorial", preferredStyle: .ActionSheet)
            let goAction = UIAlertAction(title: "See English version", style: .Default) { (action) in
                UIApplication.sharedApplication().openURL(NSURL(string: "http://www.raywenderlich.com/89562/watchkit-tutorial-with-swift-getting-started")!)
            }
            alertController.addAction(goAction)
            let OKAction = UIAlertAction(title: "See the Chinese version", style: .Default) { (action) in
                UIApplication.sharedApplication().openURL(NSURL(string: "https://drive.google.com/file/d/0BzSMfqxlsM0wNEQ2Z2tKdDZINXM/view?usp=sharing")!)
                
            }
            alertController.addAction(OKAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                
                
            }
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }
            
            alertController.view.tintColor = UIColor.blackColor()

            
        default:
            break
        }
    }
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
           
            scrollView.delegate = self
            scrollView.minimumZoomScale = 1.0
            scrollView.maximumZoomScale = 1.0
            scrollView.flashScrollIndicators()
            scrollView.showsVerticalScrollIndicator = true
            
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var projectName: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return tableView
    }
    
    var index = 0
    let imageName :[String] = ["purdueApp.png","QuestBoard.png","stanford.png","DBFM.png","ZombieConga.png","watchKit.png"]
    let projectNameArray : [String] = ["Purdue App","QuestBoard","virtualU","DBFM","ZombieConga","WatchKit Tutorial"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.image.image = UIImage(named: imageName[index])
        self.projectName.text = projectNameArray[index]
        self.tableView.backgroundColor = UIColor.lightGrayColor()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        switch index {
            case 0:
                if indexPath.row == 0 {
                    cell?.textLabel?.text = "Team member of Purdue App Dev Team"
                } else if indexPath.row == 1 {
                    cell?.textLabel?.text = "Localize the App to all Chinese student by providing the Simplified Chinese Language version"
                } else if indexPath.row == 2{
                    cell?.textLabel?.text = "Featured & Recommended by Lafayette Journal and Courier, a Gannett Company"
                }
            case 1:
                if indexPath.row == 0 {
                    cell?.textLabel?.text = "Hackathon Winner : Apple Best iOS or OS X App Hack the Anvil"
                } else if indexPath.row == 1 {
                    cell?.textLabel?.text = "One of two iOS Developer in the team. iOS Technology used: CoreLocation, MapKit, SearchController,TableViewController, NSUserDefault. Library used : QTree, Socket IO"
                } else if indexPath.row == 2{
                    cell?.textLabel?.text = "http://challengepost.com/software/questboard"
                }
            case 2:
                if indexPath.row == 0 {
                    cell?.textLabel?.text = "Show University Location on Map View with annotation directing to detailed Table View Controller"
                } else if indexPath.row == 1 {
                    cell?.textLabel?.text = "Collection View to show University Ranking based on USNEWS, etc."
                } else if indexPath.row == 2{
                    cell?.textLabel?.text = "Integrate Google Street View API for providing virtual tour of university."
                }
            case 3:
                if indexPath.row == 0 {
                    cell?.textLabel?.text = "This is a Swift Media Plyaer"
                } else if indexPath.row == 1 {
                    cell?.textLabel?.text = "MediaPlayer, JSON Serialization, Network"
                } else if indexPath.row == 2{
                    cell?.textLabel?.text = "Use third party media API to stream the music"
                }
            case 4:
                if indexPath.row == 0 {
                    cell?.textLabel?.text = "Implement iOS game by using SpriteKit"
                } else if indexPath.row == 1 {
                    cell?.textLabel?.text = "SpriteKit,RayWenderlich SpriteKit tutorial for iOS SpriteKit"
                } else if indexPath.row == 2{
                    cell?.textLabel?.text = "Still learning SpriteKit, CoreData from Raywenderlich.com"
                }
            case 5:
                if indexPath.row == 0 {
                    cell?.textLabel?.text = "Translate Raywenderlich WatchKit tutorial into Chinese"
                } else if indexPath.row == 1 {
                    cell?.textLabel?.text = "Help Chinese iOS developer get started with iOS WatchKit"
                } else if indexPath.row == 2{
                    cell?.textLabel?.text = "Avaliable on Google Drive"
                }
            default:
                break
        }
        
        return cell!
    }


}
