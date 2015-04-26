//
//  ExperienceViewController.swift
//  Gelei_Chen
//
//  Created by Gelei Chen on 15/4/25.
//  Copyright (c) 2015年 Geilei_Chen. All rights reserved.
//

import UIKit

class ExperienceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    
    
    //experience
    
    let experience_text1 :[String] = ["Software Engineering Intern","At PayPal Singapore (Singapore)","PayPal iOS Team"]
    let experience_text2 :[String] = ["iOS App Developer & Campus Leader","At American Culture Education (Los Angeles, CA)","Education startup by Pomona College graduate student at Claremont, CA","Create iOS App named: VirtualU, which provides college Information for students and offers virtual tour for students."]
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
        //experience

        if indexPath.section == 0{
            cell.textLabel?.text = experience_text1[indexPath.row]
        } else {
            cell.textLabel?.text = experience_text2[indexPath.row]
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return experience_text1.count
        } else {
            return experience_text2.count
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        if section == 0{
            cell.imageView?.image = UIImage(named: "paypal.jpg")
            cell.textLabel?.text = "PayPal Singapore"
        } else {
            cell.imageView?.image = UIImage(named: "ace.png")
            cell.textLabel?.text = "American Cultural Education"
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
