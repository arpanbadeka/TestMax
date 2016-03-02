//
//  SettingsViewController.swift
//  TestMax
//
//  Created by Arpan Badeka on 2/27/16.
//  Copyright © 2016 abc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var answeredLabel: UILabel!
    @IBOutlet var gameModeButtons: [UIButton]!
    
    
    @IBAction func gameModeButtonHandler(sender: UIButton) {
        for button in gameModeButtons {
            if sender != button{
                button.alpha = 0.7
            }else{
                button.alpha = 1.0
                gameMode = button.tag
            }
        }
    }
    
    @IBAction func reviewAnswered(sender: AnyObject) {
        self.performSegueWithIdentifier("reviewSegue", sender: self);
    }
    
    @IBAction func playButtonHandler(sender: UIButton) {
        var vc: UIViewController?
        switch gameMode{
        case 0:
            //MultipleChoice Quiz
            vc = storyboard?.instantiateViewControllerWithIdentifier("multipleChoiceQuestionsViewController") as! MultipleChoiceQuestionsViewController
            break
        default:
            break
        }
        if(vc != nil){
            navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    var gameMode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      view.backgroundColor = UIColor(patternImage: UIImage(named: "iphone6bg")!)
        
        for (idx, button) in gameModeButtons.enumerate(){
            button.tag = idx
            if(button.tag != 0){
                button.alpha = 0.7
            }
            
            
        }
        
      
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        var count = 0;
        for obj in multipleArray! where obj is NSDictionary
        {
            if((obj["UserAnswer"] as! NSString).length  > 0)
            {
                ++count;
            }
        }
        
        self.answeredLabel.text = "\(count)/22 Questions Answered";
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
