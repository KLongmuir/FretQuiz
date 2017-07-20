//
//  ViewController.swift
//  FretQuiz
//
//  Created by Longmuir, Kevin on 7/11/17.
//  Copyright © 2017 Longmuir, Kevin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var instrStrings: Array<UIView> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let lineMaker = Lines()
        instrStrings.append(lineMaker.generateLine(stringName: "E"))
        instrStrings.append(lineMaker.generateLine(stringName: "A"))
        instrStrings.append(lineMaker.generateLine(stringName: "D"))
        instrStrings.append(lineMaker.generateLine(stringName: "G"))
        
        for strng in instrStrings {
            view.addSubview(strng)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

