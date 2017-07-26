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
    var numHorizontalLines = 0
    var numVerticalLines = 0
    var screenWidth = 0
    var screenHeight = 0
    let fretWidth = 67
    
    let stringDict: [String:Int] = ["E": 326, "A": 251, "D": 176, "G": 101]
    
    var fretDict: [String:Int] = [:]
    
    
    
    // 976 is the space I have width wise
    // margin of 24 pixels on each side
    // need 13 frets, the first creating space for the open string
    
    // !!! width is from 50 to 924
    
    // each fret gets 67 pixels worth of space, 5 of which goes to
    // width of the fret
    
    init(screenDimensions: CGRect){
        screenWidth = Int(screenDimensions.width)
        print(screenWidth)
        screenHeight = Int(screenDimensions.height)
        print(screenHeight)
        fretDict = ["0": (44 + fretWidth), "1": (46 + (fretWidth*2)), "2": (46 + (fretWidth*3)), "3": (46 + (fretWidth*4)), "4": (46 + (fretWidth*5)), "5": (46 + (fretWidth*6)), "6": (46 + (fretWidth*7)), "7": (46 + (fretWidth*8)), "8": (46 + (fretWidth*9)), "9": (46 + (fretWidth*10)), "10": (46 + (fretWidth*11)), "11": (46 + (fretWidth*12)), "12": (46 + (fretWidth*13))]
    }
    
    func generateCircle(stringName: String) -> CAShapeLayer {
        var stringSplit = stringName.components(separatedBy: ":")
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: fretDict[stringSplit[1]]!,y: stringDict[stringSplit[0]]!), radius: CGFloat(6), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.red.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        
        return shapeLayer
    }
    
    
    func generateHorizontalLine(stringName: String) -> UIView {
        let location = nameToLocation(name: stringName)
        let newLine = UIView(frame: location)
        newLine.backgroundColor = UIColor.black
        incrNumHorLines()
        return newLine
    }
    
    func generateVerticalLine(stringName: String) -> UIView {
        let location = nameToLocation(name: stringName)
        let newLine = UIView(frame: location)
        if (stringName == "0"){
            newLine.backgroundColor = UIColor.gray
        }
        else if(stringName == "3" || stringName == "5" || stringName == "7" || stringName == "9" || stringName == "12"){
            newLine.backgroundColor = UIColor.blue
        }
        else {
            newLine.backgroundColor = UIColor.darkGray
        }
        incrNumVerLines()
        return newLine
    }
    
    func nameToLocation(name: String) -> CGRect {
        if(name == "E"){
            return CGRect(x: 50, y: 325, width: screenWidth-100, height: 3)
        }
        else if(name == "A"){
            return CGRect(x: 50, y: 250, width: screenWidth-100, height: 3)
        }
        else if(name == "D"){
            return CGRect(x: 50, y: 175, width: screenWidth-100, height: 3)
        }
        else if(name == "G"){
            return CGRect(x: 50, y: 100, width: screenWidth-100, height: 3)
        }
        else if(name == "0"){
            return CGRect(x: (50 + (fretWidth * (Int(name)!+1))), y: 75, width: 5, height: 285)
        }
        else if(Int(name)! > 0 && Int(name)! < 14){
            return CGRect(x: (50 + (fretWidth * (Int(name)!+1))), y: 75, width: 3, height: 285)
            
        }
        else {
            return CGRect(x: 0, y: 0, width: 0, height: 0)
        }
    }
    
    func incrNumHorLines(){
        numHorizontalLines += 1
    }
    
    func decrNumHorLines(){
        numHorizontalLines -= 1
    }
    
    func incrNumVerLines(){
        numVerticalLines += 1
    }
    
    func decrNumVerLines(){
        numVerticalLines -= 1
    }
}
