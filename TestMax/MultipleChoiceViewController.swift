//
//  MultipleChoiceViewController.swift
//  TestMax
//
//  Created by Arpan Badeka on 2/27/16.
//  Copyright © 2016 abc. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {

    
    @IBOutlet weak var questLabel: UILabel!
    
    @IBOutlet var ansLabel: [UIButton]!
    
    @IBOutlet weak var cardButton: UIButton!
    
    @IBAction func ansButtonHandler(sender: UIButton) {
        if sender.titleLabel!.text == correctAnswer {
//            sender.backgroundColor = UIColor.greenColor()
            print("correct")
        }else {
            sender.backgroundColor = UIColor.redColor()
            print("wrong")
        }
        for button in ansLabel{
            
            button.enabled = false
            if sender.titleLabel!.text == correctAnswer {
                sender.backgroundColor = UIColor.greenColor()
            }
        }
        cardButton.enabled = true
    }
    
    @IBAction func cardButtonHandler(sender: UIButton) {
        cardButton.enabled = true
        if questionsIdx < multipleArray!.count - 1 {
            questionsIdx++
        }else {
            questionsIdx = 0
        }
        nextQuestion()
    }
    
    var correctAnswer: String?
    
    var questions: String?
    
    var answers = [String]()
    
    var questionsIdx = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(patternImage: UIImage(named: "iphone6bg")!)
        
        cardButton.enabled = false
        nextQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextQuestion() {
        let currentQuestions = multipleArray![questionsIdx]
        
        answers = currentQuestions["Answers"] as! [String]
        correctAnswer = currentQuestions["CorrectAnswer"] as? String
        questions = currentQuestions["Question"] as? String
        
        lableTitle()
    }
    
    func lableTitle() {
        for(idx,button) in ansLabel.enumerate() {
            button.titleLabel!.lineBreakMode = .ByWordWrapping
            button.setTitle(answers[idx], forState: .Normal)
            button.enabled = true
            button.backgroundColor = UIColor(red: 67.0/255.0, green: 150.0/255.5, blue: 223.0/255.0, alpha: 1)
        }
        
        questLabel.text = questions
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
