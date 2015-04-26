//
//  ViewController.swift
//  Gelei_Chen
//
//  Created by Gelei Chen on 15/4/25.
//  Copyright (c) 2015 Geilei_Chen. All rights reserved.
//

import UIKit
import QuartzCore
import CoreImage
import Persei
import KINWebBrowser

class ViewController: UITableViewController,MenuViewDelegate,UIPopoverPresentationControllerDelegate  {
    private weak var menu: MenuView!
    private weak var popupController : UIViewController!
    let backgroundColor :[[CGFloat]] = [[255/255,200/255,188/255],[242/255,192/255,12/255],[240/255,116/255,62/255],[171/255,89/255,145/255],[103/255,90/255,110/255],[242/255,192/255,12/255],[255/255,200/255,188/255]]
    let name :[String] = ["Basic Info","Summary","Resume Copy","Education","Experience","Skill"]
    let image : [String] = ["info.png","summary.png","coverLetter.png","education.png","experience.png","skill.png"]
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? CustomTableViewCell
        cell?.backgroundColor = UIColor(red: backgroundColor[indexPath.row][0], green:backgroundColor[indexPath.row][1], blue: backgroundColor[indexPath.row][2], alpha: 0.95)
        cell?.imageToShow.image = UIImage(named: image[indexPath.row])
        cell?.label.text = name[indexPath.row]
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        title = name[indexPath.row]
        
        switch indexPath.row {
        case 2:
            let webBrowser = KINWebBrowserViewController.webBrowser()
            
            webBrowser.showsPageTitleInNavigationBar = true
            webBrowser.actionButtonHidden = true
            webBrowser.tintColor = UIColor.blackColor()
            webBrowser.loadURL(NSURL(string: "https://drive.google.com/file/d/0BzSMfqxlsM0wc3Q4STRRdEhGZkE/view?usp=sharing"))
            self.navigationController?.pushViewController(webBrowser, animated: true)
        case 3:
            self.performSegueWithIdentifier("toEducation", sender: self)
        case 4:
            self.performSegueWithIdentifier("toExperience", sender: self)
        case 5:
            self.performSegueWithIdentifier("toSkill", sender: self)
        default:
            self.performSegueWithIdentifier("toEntry", sender: self)
            
        }
        
        
        
    }
    
    var menuIndex = 0
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.tableView.allowsSelection = true
        loadMenu()
        
        title = "Gelei Chen"
    }
    
    private func loadMenu() {
        
        let menu = MenuView()
        menu.delegate = self
        menu.items = items
        
        tableView.addSubview(menu)
        
        self.menu = menu
    }
    

    
    // MARK: - Items
    private let items = (0..<6 as Range).map {
        MenuItem(image: UIImage(named: "menu_icon_\($0)")!)
    }
    
   
    
    // MARK: - Actions
    @IBAction
    private func switchMenu() {
        menu.setRevealed(!menu.revealed, animated: true)
    }
    
    // MARK: - MenuViewDelegate
    func menu(menu: MenuView, didSelectItemAtIndex index: Int) {
        let center: CGPoint = {
            let itemFrame = self.menu.frameOfItemAtIndex(self.menu.selectedIndex!)
            let itemCenter = CGPoint(x: itemFrame.midX, y: itemFrame.midY)
            var convertedCenter = self.menu.convertPoint(itemCenter, fromView: self.view)
            convertedCenter.y = 0
            
            return convertedCenter
            }()
        
        let transition = CircularRevealTransition(layer: self.menu.layer, center: center)
        transition.start()
        
        menuIndex = index
        
        self.performSegueWithIdentifier("toPopup", sender: self)
        
        
        
    }
    /*
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        self.view.layoutIfNeeded()
        println("viewWillTransitionTosize")
        println(size.height)
        //deal with other state
        if size.height < 420 {
           UIView.animateWithDuration(coordinator.transitionDuration(), animations: { () -> Void in
            if (self.popupController != nil){
                self.popupController.view.bounds = CGRectMake(0, 0, (size.height-20) * 0.75, size.height-20)
                self.view.layoutIfNeeded()
            }
            
           })
        } else {
            UIView.animateWithDuration(coordinator.transitionDuration(), animations: { () -> Void in
                if self.popupController != nil{
                    self.popupController.view.bounds = CGRectMake(0, 0, 300,400)
                    self.view.layoutIfNeeded()
                }
               
            })
        }

    }*/
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toPopup"{
            let dvc = segue.destinationViewController as! MenuViewController
            dvc.index = menuIndex
            let popupSegue = segue as! CCMPopupSegue
            popupSegue.destinationBounds = CGRectMake(0, 0, 50, 50)
            
            
            if (self.view.bounds.size.height < 420) {
                
                popupSegue.destinationBounds = CGRectMake(0, 0, 300, 400)
            //6 plus
            } else if (self.view.bounds.size.height == 736) {
                popupSegue.destinationBounds = CGRectMake(0, 0, (UIScreen.mainScreen().bounds.size.height-200) * 0.7, UIScreen.mainScreen().bounds.size.height-250)
            // 6
            } else if (self.view.bounds.size.height == 667) {
                popupSegue.destinationBounds = CGRectMake(0, 0, (UIScreen.mainScreen().bounds.size.height-150) * 0.65, UIScreen.mainScreen().bounds.size.height-200)
            // 5s / 5
            } else if (self.view.bounds.size.height == 568) {
                popupSegue.destinationBounds = CGRectMake(0, 0, (UIScreen.mainScreen().bounds.size.height-150) * 0.7, UIScreen.mainScreen().bounds.size.height-200)
            // 4s
            } else if (self.view.bounds.size.height == 480) {
                popupSegue.destinationBounds = CGRectMake(0, 0, (UIScreen.mainScreen().bounds.size.height-100) * 0.7, UIScreen.mainScreen().bounds.size.height-150)
            // ipad
            } else {
                popupSegue.destinationBounds = CGRectMake(0, 0, (UIScreen.mainScreen().bounds.size.height-100) * 0.7, UIScreen.mainScreen().bounds.size.height-150)
            }
            popupSegue.backgroundBlurRadius = 7
            popupSegue.backgroundViewAlpha = 0.3
            popupSegue.backgroundViewColor = UIColor.blackColor()
            popupSegue.dismissableByTouchingBackground = true
            self.popupController = popupSegue.destinationViewController as! UIViewController;
        }
        
    }
}
