//
//  EntryViewController.swift
//  Gelei_Chen
//
//  Created by Gelei Chen on 15/4/24.
//  Copyright (c) 2015 Geilei_Chen. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{


    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.tintColor = UIColor.blackColor()
        }
    }
    //basic info
    let name :[String] = ["Hao44le","Linkedin.com/in/geleichen","geleichen@hotmail.com","Geleichen.me","321 Earhart Hall, First Street, West Lafayette, IN 47096"]
    let image : [String] = ["github.png","linkedin.png","email.png","website.png","home.png"]
    
    //summary
    
    let summary_text :[String] = ["Hi! My name is Gelei Chen. I'm a sophomore Computer Science student at Purdue University,specializing in Software Engineering. I look forward to offer my problem solving and programming skills to an internship software engineering position!","As an iOS developer, I have taste. I spend lots of time designing user interface before I actually start programming, because user experience is the most important aspect of any product. And also every detail matters!"]
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (self.navigationController?.navigationItem.title)! {
            
        //basic info
        case "Basic Info":
            return name.count
            
        //summary
        case "Summary":
            return summary_text.count
            

            
        //skill
        case "Skill":
            return 2
        
        default:
            break
        }
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch (self.navigationController?.navigationItem.title)! {
            
            
        //basic info
        case "Basic Info":
            return CGFloat(50)
            
            
        //summary
        case "Summary":
            return CGFloat(150)
            

            
        
        //skill
        case "Skill":
            break
        
        
        default:
            break
        }
        return CGFloat(50)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        switch (self.navigationController?.navigationItem.title)! {
        
        //basic info
        case "Basic Info":
            cell?.textLabel?.text = name[indexPath.row]
            cell?.imageView?.image = UIImage(named: image[indexPath.row])
            cell?.imageView?.contentMode = .ScaleToFill
            /*
            switch indexPath.row{
            case 0:
                cell?.textLabel?.textColor = UIColor(red: 245/255, green: 61/255, blue: 0, alpha: 1)
            case 1:
                cell?.textLabel?.textColor = UIColor.orangeColor()
            case 2:
                cell?.textLabel?.textColor = UIColor.yellowColor()
            case 3:
                cell?.textLabel?.textColor = UIColor.greenColor()
            case 4:
                cell?.textLabel?.textColor = UIColor.blueColor()
            case 5:
                cell?.textLabel?.textColor = UIColor(red: 75/255, green: 0, blue: 130/255, alpha: 1)
            case 6:
                cell?.textLabel?.textColor = UIColor(red: 238/255, green: 130/255, blue: 238/255, alpha: 1)
            default:
                break
            }
            */
        
        //summary
        case "Summary":
            cell?.textLabel?.text = summary_text[indexPath.row]
            if indexPath.row == 0{
                cell?.textLabel?.textColor = UIColor(red: 255/255, green: 102/255, blue: 51/255, alpha: 1)
            } else {
                cell?.textLabel?.textColor = UIColor.lightGrayColor()
            }
            
            
    

        
        
        //skill
        case "Skill":
            break
        
        
        default:
            break
        }
        
        return cell!
    }
    override func viewDidLoad() {
        
    }
}
