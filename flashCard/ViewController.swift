//
//  ViewController.swift
//  flashCard
//
//  Created by Scott Courtney on 9/2/16.
//  Copyright © 2016 Scott Courtney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Number1: UILabel!
    @IBOutlet weak var Number2: UILabel!
    
    
    @IBOutlet weak var Sign: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    
    @IBOutlet weak var Next: UIButton!
    
    @IBOutlet weak var Image: UIImageView!
    
    var CorrectAnswer = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AdditionQuestions()
//        SubtractionQuestions()
//        MultiplicationQuestions()
//        DivisionQuestions()
        Hide()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func AdditionQuestions() {
        var RandomNumber = arc4random() % 1
        RandomNumber += 1

        let num1 = Int(arc4random_uniform(20))
        let num2 = Int(arc4random_uniform(20))
        let answer = num1 + num2
        let answer2 = answer + 1
        let answer3 = answer - 1
        let answer4 = answer + 2
        var randomAnswer = [answer, answer2, answer3, answer4]
        let index = Int(arc4random_uniform(UInt32(randomAnswer.count)))

        switch(RandomNumber){
            case 1:
                Number1.text = String(num1)
                Number2.text = String(num2)

                Button1.setTitle(String(randomAnswer[index]), forState: UIControlState.Normal)
                Button2.setTitle(String(randomAnswer[index]), forState: UIControlState.Normal)
                Button3.setTitle(String(randomAnswer[index]), forState: UIControlState.Normal)
                Button4.setTitle(String(randomAnswer[index]), forState: UIControlState.Normal)

                CorrectAnswer = "1"
                
                break
            
            default:
                break
        }
        
    }




    
    func Hide() {
        Image.hidden = true
        Next.hidden = true
    }
    func Show() {
        Image.hidden = false
        Next.hidden = false
    }
    
    func Reload() {
        delay(1.0){
            self.Image.hidden = true
        }
    }
    
    func delay(delay: Double, closure: ()->()) {
 
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(),
            closure
        )
    }
    
    
    @IBAction func Button1Action(sender: AnyObject) {
        Show()
    
        if (CorrectAnswer == "1"){
            Image.image = UIImage(named: ("correct.png"))
        }
        else {
            Image.image = UIImage(named: ("wrong.png"))
            Reload()
        }
    }
    
    @IBAction func Button2Action(sender: AnyObject) {
        Show()
        
        if (CorrectAnswer == "2"){
            Image.image = UIImage(named: ("correct.png"))
        }
        else {
            Image.image = UIImage(named: ("wrong.png"))
            Reload()

        }
    }

    @IBAction func Button3Action(sender: AnyObject) {
        Show()
        
        if (CorrectAnswer == "3"){
            Image.image = UIImage(named: ("correct.png"))
        }
        else {
            Image.image = UIImage(named: ("wrong.png"))
            Reload()
        }
    }

    @IBAction func Button4Action(sender: AnyObject) {
        Show()
        
        if (CorrectAnswer == "4"){
            Image.image = UIImage(named: ("correct.png"))
        }
        else {
            Image.image = UIImage(named: ("wrong.png"))
            Reload()
        }
    }
    
    @IBAction func Next(sender: AnyObject) {
        AdditionQuestions()
        Hide()
    }
}

