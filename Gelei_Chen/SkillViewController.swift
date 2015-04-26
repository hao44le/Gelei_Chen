//
//  SkillViewController.swift
//  Gelei_Chen
//
//  Created by Gelei Chen on 15/4/26.
//  Copyright (c) 2015 Geilei_Chen. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.allowsSelection = false
        }
    }
    
    //skill
    
    let skill_proficient :[String] = ["Swift","iOS","C/C++","Java","HTML/CSS","Git","UNIX","Linux","Windows","Mac"]
    let detail_proficient :[String] = ["My favorite language","The best","GTK/Linux GUI","Learn to do Android","Web development","Source Control","All Purdue CS Lab machine","Working on GTK C GUI","I prefer Mac","Yes, he likes me"]
    let skill_familiar : [String] = ["Android","Bash","Objective-C","R","Socket.io"]
    let detail_familiar : [String] = ["So much pain.Purdue CS course required.>_<.","Required by CS department","I can understand it","Learn from Statisticis class","Awesome library for iOS network"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        //skill
        
        if indexPath.section == 0{
            cell.textLabel?.text = skill_proficient[indexPath.row]
            cell.detailTextLabel?.text = detail_proficient[indexPath.row]
        } else {
            cell.textLabel?.text = skill_familiar[indexPath.row]
            cell.detailTextLabel?.text = detail_familiar[indexPath.row]
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return skill_proficient.count
        } else {
            return skill_familiar.count
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        if section == 0{
            cell.imageView?.image = UIImage(named: "ios.png")
            cell.textLabel?.text = "Proficient"
            cell.detailTextLabel?.text = ":-) I am an iOS Developer"
        } else {
            cell.imageView?.image = UIImage(named: "oc.png")
            cell.textLabel?.text = "Familiar"
            cell.detailTextLabel?.text = "There is always more to learn"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
