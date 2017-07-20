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
        let newLine = UIView(frame: location)
        newLine.backgroundColor = UIColor.black
        incrNumLines()
        return newLine
    }
    
    func nameToLocation(name: String) -> CGRect {
        if(name == "E"){
            return CGRect(x: 225, y: 300, width: 550, height: 10)
        }
        else if(name == "A"){
            return CGRect(x: 225, y: 250, width: 550, height: 10)
        }
        else if(name == "D"){
            return CGRect(x: 225, y: 200, width: 550, height: 10)
        }
        else if(name == "G"){
            return CGRect(x: 225, y: 150, width: 550, height: 10)
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
