//
//  ViewController.swift
//  simplecalc-ios
//
//  Created by Qiaosi Wang on 1/28/18.
//  Copyright © 2018 ischool-uw. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }

    var display : String = "0" {
        didSet {
            outputLabel.text = display
        }
    }
    var op: String = ""
    var numbers: [Int] = []
    var numCount : Int = 0
    var begin : Bool = false
    var calcBank : [String] = []
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        if self.op == "" && self.display == "0" {
            self.display = ""
        } else if self.begin == true{
            self.display = ""
            self.begin = false
        }
        self.display = self.display + String(sender.tag)
    }
    
    @IBAction func allClearPressed(_ sender: UIButton) {
        self.display = "0"
        self.op = ""
        self.numbers = []
        self.begin = false
        self.numCount = 0
    }
    
    @IBAction func modPressed(_ sender: UIButton) {
        numbers.append(Int(self.display)!)
        self.op = "%"
        self.begin = true
    }
    
    @IBAction func dividePressed(_ sender: UIButton) {
        numbers.append(Int(self.display)!)
        self.op = "/"
        self.begin = true
    }
    
    @IBAction func multiplyPressed(_ sender: UIButton) {
        numbers.append(Int(self.display)!)
        self.op = "*"
        self.begin = true
    }
    
    @IBAction func subtractPressed(_ sender: UIButton) {
        numbers.append(Int(self.display)!)
        self.op = "-"
        self.begin = true
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        numbers.append(Int(self.display)!)
        self.op = "+"
        self.begin = true
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        numbers.append(Int(self.display)!)
        var result : Int
        self.begin = true
        switch self.op{
            case "%":
                self.display = String(numbers[0]%numbers[1])
            case "/":
                self.display = String(numbers[0]/numbers[1])
            case "-":
                self.display = String(numbers[0]-numbers[1])
            case "+":
                self.display = String(numbers[0]+numbers[1])
            case "*":
                self.display = String(numbers[0]*numbers[1])
            case "count":
                self.display = String(numbers.count)
            case "avg":
                var sum : Int = 0
                numCount += 1
                for num in numbers {
                    sum += num
                }
                self.display = String(sum/numCount)
            default:
                self.display = "error occurred"
            
        }
        result = Int(self.display)!
        var entry : String = ""
        if self.op == "count" || self.op == "avg" {
            let oprator : String = self.op
            for index in 0...numbers.count - 2 {
                entry = entry + String(numbers[index]) + " \(oprator) "
            }
            entry = entry + String(numbers[numbers.count - 1]) + " = \(result)"
        } else {
            entry = String(self.numbers[0]) + self.op + String(self.numbers[1]) + " = " + String(result)
        }
        self.calcBank.append(entry)
        self.op = "="
        self.numbers = []
    }
    
    @IBAction func countPressed(_ sender: UIButton) {
        numbers.append(Int(self.display)!)
        self.op = "count"
        self.begin = true
    }
    
    @IBAction func avgPressed(_ sender: UIButton) {
        numbers.append(Int(self.display)!)
        self.op = "avg"
        self.numCount += 1
        self.begin = true
    }
    
    @IBAction func factPressed(_ sender: UIButton) {
        self.op = "fact"
        var num : Int = Int(self.display)!
        let orNum : Int = num
        var sum : Int = num
        if num == 0 {
            self.display = "1"
            sum = 1
        } else {
            while num != 1 {
                sum = sum * (num - 1)
                num = num - 1
            }
        }
        self.display = String(sum)
        let entry : String = String(orNum) + " fact = \(sum)"
        self.calcBank.append(entry)
        
    }
    
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! HistoryViewController
        destination.calcBank = calcBank
    }


}
