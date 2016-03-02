//
//  ViewController.swift
//  TestMax
//
//  Created by Arpan Badeka on 2/26/16.
//  Copyright © 2016 abc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBAction func Reset(sender: AnyObject) {
//        multipleArray = []
     let fileManager = NSFileManager.defaultManager()
        if let bundlePath = NSBundle.mainBundle().pathForResource("MultipleChoice", ofType: "plist") {
            let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
            
            multipleArray = resultDictionary!["Questions"]!.mutableCopy() as? Array
            resultDictionary?.writeToFile(path, atomically: true);
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       view.backgroundColor = UIColor(patternImage: UIImage(named: bgImage!)!)
    //    view.backgroundColor = UIColor.clearColor()
        loadQuizData()
        
    }
    
    @IBAction func newGameStartButton(sender: AnyObject) {
        performSegueWithIdentifier("mainVC", sender: self)
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func loadQuizData() {
//        //Multiple Choice Quiz
//        let dictMC = NSDictionary(contentsOfFile: pathMC!)
//        multipleArray = dictMC!["Questions"]!.mutableCopy() as? Array
//        check()
//    }
    
//    func check() {
//        print(multipleArray)
//    }

    func loadQuizData() {
        // getting path to GameData.plist
       
        let fileManager = NSFileManager.defaultManager()
        //check if file exists 

        if(!fileManager.fileExistsAtPath(path)) {
            // If it doesn't, copy it from the default file in the Bundle
            if let bundlePath = NSBundle.mainBundle().pathForResource("MultipleChoice", ofType: "plist") {
                let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
                
                multipleArray = resultDictionary!["Questions"]!.mutableCopy() as? Array
                resultDictionary?.writeToFile(path, atomically: true);
            }
            
        } else {
            print("MultipleCHoice.plistalready exits at path.")
            let resultDictionary = NSMutableDictionary(contentsOfFile:path)
            multipleArray = resultDictionary!["Questions"]!.mutableCopy() as? Array
            resultDictionary?.writeToFile(path, atomically: true);
        }
        
    }
    
    
    
    
}

