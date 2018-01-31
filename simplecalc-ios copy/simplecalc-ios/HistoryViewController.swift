//
//  HistoryViewController.swift
//  simplecalc-ios
//
//  Created by Qiaosi Wang on 1/30/18.
//  Copyright © 2018 ischool-uw. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController : UIViewController{
    
    var calcBank:[String] = []
    
    @IBOutlet weak var historyDisplay: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(calcBank.count != 0){
            historyDisplay.contentSize = CGSize(width:300,height:calcBank.count*25 + 60)
            for index in 0 ... calcBank.count-1{
                let label = UILabel(frame:CGRect(x: 50, y: index*25+50, width: 300, height: 40))
                label.text = calcBank[index]
                historyDisplay.addSubview(label)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        destination.calcBank = calcBank
    }
}


