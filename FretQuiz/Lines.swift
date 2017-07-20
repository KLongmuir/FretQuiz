//
//  Strings.swift
//  FretQuiz
//
//  Created by Longmuir, Kevin on 7/20/17.
//  Copyright © 2017 Longmuir, Kevin. All rights reserved.
//

import Foundation
import UIKit

class Lines {
    var numLines = 0
    
    func generateLine(stringName: String) -> UIView {
        let location = nameToLocation(name: stringName)
        let randomIndex1: CGFloat = CGFloat(arc4random_uniform(255))
        let randomIndex2: CGFloat = CGFloat(arc4random_uniform(255))
        let randomIndex3: CGFloat = CGFloat(arc4random_uniform(255))
        
        let myColor = UIColor(red: randomIndex1/255.0, green: randomIndex2/255.0, blue: randomIndex3/255.0, alpha: 1)
        
        let newBox = UIView(frame: location)
        newBox.backgroundColor = myColor
        incrNumLines()
        return newBox
    }
    
    func nameToLocation(name: String) -> CGRect {
        if(name == "E"){
            return CGRect(x: 275, y: 300, width: 500, height: 10)
        }
        else if(name == "A"){
            return CGRect(x: 275, y: 250, width: 500, height: 10)
        }
        else if(name == "D"){
            return CGRect(x: 275, y: 200, width: 500, height: 10)
        }
        else if(name == "G"){
            return CGRect(x: 275, y: 150, width: 500, height: 10)
        }
        else {
            return CGRect(x: 0, y: 0, width: 0, height: 0)
        }
    }
    
    func incrNumLines(){
        numLines += 1
    }
    
    func decrNumLines(){
        numLines -= 1
    }
}
