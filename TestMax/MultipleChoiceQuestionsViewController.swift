//
//  MultipleChoiceQuestionsViewController.swift
//  TestMax
//
//  Created by Arpan Badeka on 2/29/16.
//  Copyright © 2016 abc. All rights reserved.
//

import UIKit



class MultipleChoiceQuestionsViewController: UIViewController, UIScrollViewDelegate, UITextViewDelegate , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet var answerButton: [UIButton]!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var previousButton: UIButton!
    
    @IBOutlet weak var optionTableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentViewHieghtConstraint: NSLayoutConstraint!
    var correctAnswer: String?
    
    var questions: String?
    
    var answers = [String]()
    
    var questionsIdx = 0
    
    var userAnswer: String?

     func onCellCall(questionIdx1: Int){
        questionsIdx = questionIdx1
        nextQuestion()
    }
    
    @IBAction func nextButtonHandler(sender: UIButton) {
        nextButton.enabled = true
        if questionsIdx < multipleArray!.count - 1 {
            questionsIdx++
        }else {
            nextButton.hidden = true;
        }
        
        if(questionsIdx > 0 && previousButton.hidden)
        {
            previousButton.hidden = false;
        }
        
        nextQuestion()
        
    }
    
    
    @IBAction func previousButtonHandler(sender: UIButton) {
        //previousButton.enabled = true
        if questionsIdx == 0 {
            previousButton.hidden = true;
        }else {
            questionsIdx--
        }
        
        if(questionsIdx < (multipleArray?.count)! - 1 && nextButton.hidden)
        {
            nextButton.hidden = false;
        }
        
        previousQuestion()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.scrollEnabled = true
       // scrollView.scrollEnabled = true
        textView.editable = false
        textView .setContentOffset(CGPointZero, animated: false);
        // Do any additional setup after loading the view.
     //   scrollView.contentSize.height = 600
        view.backgroundColor = UIColor(patternImage: UIImage(named: bgImage!)!)
        
        nextButton.enabled = true
        previousButton.enabled = true
        
        if(questionsIdx == 0)
        {
            previousButton.hidden = true;
        }
    
        if(questionsIdx == (multipleArray?.count)! - 1)
        {
            nextButton.hidden = true;
        }
        
        
        nextQuestion()
        self.optionTableView.reloadData();
        if(userAnswer != "")
        {
            for(var i=0 ; i < 4 ; i++)
            {
                let cell = self.optionTableView.cellForRowAtIndexPath(NSIndexPath(forRow: i, inSection: 0));
                cell?.textLabel?.text = answers[i];
                
                cell?.userInteractionEnabled = false
                if(userAnswer != correctAnswer && cell?.textLabel?.text == userAnswer){
                    cell?.userInteractionEnabled = false
                    cell?.contentView.backgroundColor = UIColor.redColor()
                }else if(cell == nil || (cell?.textLabel?.text == correctAnswer)){
                    cell?.userInteractionEnabled = false
                    cell?.contentView.backgroundColor = UIColor.greenColor()
                }else {
                    cell?.contentView.backgroundColor = UIColor(red: 69.0/255.0, green: 166.0/255.0, blue: 251.0/255.0, alpha: 1)
                }
            }
        }

    }
    
    override func viewDidAppear(animated: Bool) {
        textView .setContentOffset(CGPointZero, animated: false);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewWillAppear(animated: Bool) {
//        scrollView.contentOffset = CGPointMake(0,0)
////        animated = true
//    }
  
    func nextQuestion() {
        let currentQuestions = multipleArray![questionsIdx]
        
        answers = currentQuestions["Answers"] as! [String]
        correctAnswer = currentQuestions["CorrectAnswer"] as? String
        questions = currentQuestions["Question"] as? String
        userAnswer = currentQuestions["UserAnswer"] as? String
        
        if(userAnswer == ""){
            textView.text = questions;
            
            self.optionTableView.reloadData()
        }else{
            
            for(var i=0 ; i < 4 ; i++)
            {
                let cell = self.optionTableView.cellForRowAtIndexPath(NSIndexPath(forRow: i, inSection: 0));
                cell?.textLabel?.text = answers[i];
                
              cell?.userInteractionEnabled = false
                if(userAnswer != correctAnswer && cell?.textLabel?.text == userAnswer){
                  cell?.userInteractionEnabled = false
                    cell?.contentView.backgroundColor = UIColor.redColor()
                }else if(cell == nil || (cell?.textLabel?.text == correctAnswer)){
                 cell?.userInteractionEnabled = false
                    cell?.contentView.backgroundColor = UIColor.greenColor()
                }else {
                    cell?.contentView.backgroundColor = UIColor(red: 69.0/255.0, green: 166.0/255.0, blue: 251.0/255.0, alpha: 1)
                }
            }
            textView.text = questions
            
        }
        textView .setContentOffset(CGPointZero, animated: false);
    }
    
    func previousQuestion() {
        let currentQuestions = multipleArray![questionsIdx]
        
        answers = currentQuestions["Answers"] as! [String]
        correctAnswer = currentQuestions["CorrectAnswer"] as? String
        questions = currentQuestions["Question"] as? String
        userAnswer = currentQuestions["UserAnswer"] as? String
        if(userAnswer == ""){
            textView.text = questions;
            self.optionTableView.reloadData();
        }else{
            
            for(var i=0 ; i < 4 ; i++)
            {
                let cell = self.optionTableView.cellForRowAtIndexPath(NSIndexPath(forRow: i, inSection: 0));
                cell?.textLabel?.text = answers[i];
                
                cell?.userInteractionEnabled = false
                if(userAnswer != correctAnswer && cell?.textLabel?.text == userAnswer){
                    cell?.userInteractionEnabled = false
                    cell?.contentView.backgroundColor = UIColor.redColor()
                }else if(cell?.textLabel?.text == correctAnswer){
                    cell?.userInteractionEnabled = false
                    cell?.contentView.backgroundColor = UIColor.greenColor()
                }else {
                    cell?.contentView.backgroundColor = UIColor(red: 69.0/255.0, green: 166.0/255.0, blue: 251.0/255.0, alpha: 1)
                }
            }
            textView.text = questions
        }
        textView .setContentOffset(CGPointZero, animated: false);
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        let boundingBox = answers[indexPath.row].boundingRectWithSize(CGSizeMake(320, 400), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: (UIFont.systemFontOfSize(18))], context: nil)
        
        if(boundingBox.height > 44)
        {
            return boundingBox.height+8;
        }
        else
        {
            return 64;
        }

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath);
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel!.text = answers[indexPath.row];
        
        let view = UIView(frame:CGRectMake(0,0,cell.frame.width,1));
        view.backgroundColor = UIColor.blackColor();
        cell.contentView.addSubview(view);
        
        cell.contentView.backgroundColor = UIColor(red: 69.0/255.0, green: 166.0/255.0, blue: 251.0/255.0, alpha: 1)
        cell.textLabel?.backgroundColor = UIColor.clearColor();
        cell.userInteractionEnabled = true;
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        return cell;
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        multipleArray![questionsIdx]["UserAnswer"] = answers[indexPath.row];
        userAnswer = answers[indexPath.row];
        
        for(var i=0 ; i < 4 ; i++)
        {
            
            let cell = self.optionTableView.cellForRowAtIndexPath(NSIndexPath(forRow: i, inSection: 0));
           cell?.userInteractionEnabled = false
            if userAnswer == correctAnswer && cell?.textLabel?.text == correctAnswer {
                cell?.contentView.backgroundColor = UIColor.greenColor()
            }
            else
            {
                if(cell == self.optionTableView.cellForRowAtIndexPath(indexPath))
                {
                    cell?.contentView.backgroundColor = UIColor.redColor();
                }
                else if(cell?.textLabel?.text == correctAnswer)
                {
                    cell?.contentView.backgroundColor = UIColor.greenColor();
                }
                else
                {
                    cell?.contentView.backgroundColor = UIColor(red: 69.0/255.0, green: 166.0/255.0, blue: 251.0/255.0, alpha: 1)
                }
                
            }

        }

     //   nextButton.enabled = true
        
   

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
