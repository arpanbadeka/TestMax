//
//  ReviewTableViewController.swift
//  TestMax
//
//  Created by Arpan Badeka on 3/1/16.
//  Copyright © 2016 abc. All rights reserved.
//

import UIKit

var questionIdx1: Int = 0

class ReviewTableViewController: UITableViewController {

    var resultsArr:NSMutableArray = NSMutableArray();
    var rowTapped:Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()

        var count = 0;
        for obj in multipleArray! where obj is NSDictionary
        {
            if((obj["UserAnswer"] as! NSString).length  > 0)
            {
                resultsArr.addObject(1);
            }
            else
            {
                resultsArr.addObject(0);
            }
            view.backgroundColor = UIColor(patternImage: UIImage(named: bgImage!)!)
            //self.tableView.contentInset = UIEdgeInsetsMake(0, -16, 0, 0)
            
            
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultsArr.count;
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.separatorInset = UIEdgeInsetsZero;
        if(resultsArr[indexPath.row] as! NSObject == 1)
        {
            let currentQuestions = multipleArray![indexPath.row]
            
            
            let questions = currentQuestions["Question"] as? String
            cell.textLabel?.text = questions
            cell.textLabel?.textColor = UIColor.whiteColor()
            cell.textLabel?.font = UIFont(name: "Avenir Next", size: 15)
            

        }
        else
        {
            let currentQuestions = multipleArray![indexPath.row]
            
            let questions = currentQuestions["Question"] as? String

            cell.textLabel?.text = questions
            
            cell.textLabel?.textColor = UIColor.whiteColor()
            cell.textLabel?.font = UIFont(name: "Avenir Next", size: 15)

           
            
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let currentQuestions = multipleArray![indexPath.row]
        let userAnswer = currentQuestions["UserAnswer"] as? String
        if(userAnswer == ""){
            let shareAction = UITableViewRowAction(style: .Normal, title: "Unanswered") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
                
                let firstActivityItem = multipleArray![indexPath.row]
                
                let activityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
                
                self.presentViewController(activityViewController, animated: true, completion: nil)
                
            }
            shareAction.backgroundColor = UIColor.redColor()
            return [shareAction]
        } else {
                let shareAction = UITableViewRowAction(style: .Normal, title: "Answered") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            
                    let firstActivityItem = multipleArray![indexPath.row]
            
                    let activityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
            
                    self.presentViewController(activityViewController, animated: true, completion: nil)
            }
            shareAction.backgroundColor = UIColor.greenColor()
            return [shareAction]
        }
        
    }
        
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        rowTapped = indexPath.row;
        self.performSegueWithIdentifier("showTest", sender: self);
    }



    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "showTest")
        {
            let dest:MultipleChoiceQuestionsViewController = segue.destinationViewController as! MultipleChoiceQuestionsViewController;
            dest.questionsIdx = rowTapped;
        }
    }

}
