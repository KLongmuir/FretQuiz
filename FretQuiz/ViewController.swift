//
//  ViewController.swift
//  FretQuiz
//
//  Created by Longmuir, Kevin on 7/11/17.
//  Copyright © 2017 Longmuir, Kevin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // BUTTONS
    @IBOutlet var AFlatButton: UIButton!
    @IBOutlet var AButton: UIButton!
    @IBOutlet var ASharpButton: UIButton!
    @IBOutlet var BFlatButton: UIButton!
    @IBOutlet var BButton: UIButton!
    @IBOutlet var CButton: UIButton!
    @IBOutlet var CSharpButton: UIButton!
    @IBOutlet var DFlatButton: UIButton!
    @IBOutlet var DButton: UIButton!
    @IBOutlet var DSharpButton: UIButton!
    @IBOutlet var EFlatButton: UIButton!
    @IBOutlet var EButton: UIButton!
    @IBOutlet var ESharpButton: UIButton!
    @IBOutlet var FButton: UIButton!
    @IBOutlet var FSharpButton: UIButton!
    @IBOutlet var GFlatButton: UIButton!
    @IBOutlet var GButton: UIButton!
    @IBOutlet var GSharpButton: UIButton!
    @IBOutlet var playButton: UIButton!
    
    // LABELS
    @IBOutlet var testLabel: UILabel!
    @IBOutlet var noteName: UILabel!
    @IBOutlet var pointsLabel: UILabel!
    @IBOutlet var rightWrong: UILabel!
    
    // CONSTANTS
    let priority = DispatchQoS.QoSClass.default
    let screenSize: CGRect = UIScreen.main.bounds
    let possibleNotes: Array<String> = ["A♭","A","A♯","B♭","B","C","C♯","D♭","D","D♯","E♭","E","E♯","F","F♯","G♭","G","G#"]
    let possibleFrets: Array<String> = ["E:0", "E:1", "E:2", "E:3", "E:4", "E:5", "E:6", "E:7", "E:8", "E:9", "E:10", "E:11", "E:12", "A:0", "A:1", "A:2", "A:3", "A:4", "A:5", "A:6", "A:7", "A:8", "A:9", "A:10", "A:11", "A:12", "D:0", "D:1", "D:2", "D:3", "D:4", "D:5", "D:6", "D:7", "D:8", "D:9", "D:10", "D:11", "D:12", "G:0", "G:1", "G:2", "G:3", "G:4", "G:5", "G:6", "G:7", "G:8", "G:9", "G:10", "G:11", "G:12"]
    
    let fretsToNotes: [String:Array<String>] = ["E:0": ["E"], "E:1": ["F"], "E:2": ["F♯"], "E:3": ["G"], "E:4": ["G♯", "A♭"], "E:5": ["A"], "E:6": ["A♯", "B♭"], "E:7": ["B"], "E:8": ["C"], "E:9": ["C♯","D♭"], "E:10": ["D"], "E:11": ["D♯","E♭"], "E:12": ["E"], "A:0": ["A"], "A:1": ["A♯", "B♭"], "A:2": ["B"], "A:3": ["C"], "A:4": ["C"], "A:5": ["D"], "A:6": ["D♯","E♭"], "A:7": ["E"], "A:8": ["F"], "A:9": ["F♯","G♭"], "A:10": ["G"], "A:11": ["G♯", "A♭"], "A:12": ["A"], "D:0": ["D"], "D:1": ["D♯","E♭"], "D:2": ["E"], "D:3": ["F"], "D:4": ["F♯","G♭"], "D:5": ["G"], "D:6": ["G♯", "A♭"], "D:7": ["A"], "D:8": ["A♯", "B♭"], "D:9": ["B"], "D:10": ["C"], "D:11": ["C♯","D♭"], "D:12": ["D"], "G:0": ["G"], "G:1": ["G♯", "A♭"], "G:2": ["A"], "G:3": ["A♯", "B♭"], "G:4": ["B"], "G:5": ["C"], "G:6": ["C♯","D♭"], "G:7": ["D"], "G:8": ["D♯","E♭"], "G:9": ["E"], "G:10": ["F"], "G:11": ["F♯","G♭"], "G:12": ["G"]]
    
    let lineMaker = Lines(screenDimensions: UIScreen.main.bounds)
    
    
    // VARIABLES
    var instrStrings: Array<UIView> = []
    var instrFrets: Array<UIView> = []
    var noteButtons: Array<UIButton> = []
    var isPlaying = false
    var points = 0
    var dotReference: CALayer = CALayer()
    var dotString: String = ""
    
    // COLORS
    let myGreen = UIColor(red: 103/255.0, green: 178/255.0, blue: 104/255.0, alpha: 1.0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.let screenSize = UIScreen.main.bounds
        addNoteButtons()
        
        for button in noteButtons {
            button.layer.backgroundColor = UIColor(red: 217/255.0, green: 217/255.0, blue: 217/255.0, alpha: 1.0).cgColor
            button.layer.cornerRadius = 20
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.gray.cgColor
            button.setTitleColor(UIColor.black, for: UIControlState.normal)

        }
        
        playButton.layer.backgroundColor = myGreen.cgColor
        playButton.layer.cornerRadius = 25
        playButton.layer.borderWidth = 2
        playButton.layer.borderColor = myGreen.cgColor
        playButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        makeFretboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeFretboard(){
        instrStrings.append(lineMaker.generateHorizontalLine(stringName: "E"))
        instrStrings.append(lineMaker.generateHorizontalLine(stringName: "A"))
        instrStrings.append(lineMaker.generateHorizontalLine(stringName: "D"))
        instrStrings.append(lineMaker.generateHorizontalLine(stringName: "G"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "0"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "1"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "2"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "3"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "4"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "5"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "6"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "7"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "8"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "9"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "10"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "11"))
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "12"))
        view.addSubvoew(lineMaker.generateCircle(stringName: "3Dot"))

        for strng in instrStrings {
            self.view.addSubview(strng)
        }
        
        for fret in instrFrets {
            self.view.addSubview(fret)
        }
        
        print("Fretboard is set up")
    }
    
    func addNoteButtons(){
        noteButtons.append(AFlatButton)
        noteButtons.append(AButton)
        noteButtons.append(ASharpButton)
        noteButtons.append(BFlatButton)
        noteButtons.append(BButton)
        noteButtons.append(CButton)
        noteButtons.append(CSharpButton)
        noteButtons.append(DFlatButton)
        noteButtons.append(DButton)
        noteButtons.append(DSharpButton)
        noteButtons.append(EFlatButton)
        noteButtons.append(EButton)
        noteButtons.append(ESharpButton)
        noteButtons.append(FButton)
        noteButtons.append(FSharpButton)
        noteButtons.append(GFlatButton)
        noteButtons.append(GButton)
        noteButtons.append(GSharpButton)
        
    }
    
    func newNote(){
        if isPlaying == true{
            dotString = self.possibleFrets[Int(arc4random_uniform(UInt32(self.possibleFrets.count - 1)))]
            dotReference = lineMaker.generateCircle(stringName: dotString)
            view.layer.addSublayer(dotReference)
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton){
        print(dotString)
        if (self.fretsToNotes[dotString]?.contains((sender.titleLabel?.text)!))! {
            dotReference.removeFromSuperlayer()
            self.rightWrong.text = "Correct"
            self.rightWrong.textColor = myGreen
            points += 1
            self.pointsLabel.text = "Points: " + String(points)
            self.newNote()
        }
        else {
            self.rightWrong.text = "Incorrect"
            self.rightWrong.textColor = UIColor.red
            points -= 1
            self.pointsLabel.text = "Points: " + String(points)
        }
    }
    
    @IBAction func playIt(_ sender: UIButton) {
        if isPlaying == false {
            isPlaying = true
            self.newNote()
        }
    }
    
}

