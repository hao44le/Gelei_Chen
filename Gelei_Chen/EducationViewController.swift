//
//  EducationViewController.swift
//  Gelei_Chen
//
//  Created by Gelei Chen on 15/4/25.
//  Copyright (c) 2015年 Geilei_Chen. All rights reserved.
//

import UIKit

class EducationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.separatorColor = UIColor.clearColor()
        }
    }
    
    //education
    let education_name :[String] = ["Purdue University"]
    let education_image :[String] = ["purdue.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "BS in Computer Science"
        case 1:
            cell.textLabel?.text = "Expected May 2017"
        case 2:
            cell.textLabel?.text = "GPA:3.69"
        default:
            break
        }
        return cell
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
