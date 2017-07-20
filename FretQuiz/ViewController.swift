//
//  ViewController.swift
//  FretQuiz
//
//  Created by Longmuir, Kevin on 7/11/17.
//  Copyright © 2017 Longmuir, Kevin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var boxes: Array<UIView> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let lineMaker = Lines()
        view.insertSubview(lineMaker.generateLine(stringName: "E"), at: 0)
        view.insertSubview(lineMaker.generateLine(stringName: "A"), at: 0)
        view.insertSubview(lineMaker.generateLine(stringName: "D"), at: 0)
        view.insertSubview(lineMaker.generateLine(stringName: "G"), at: 0)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

