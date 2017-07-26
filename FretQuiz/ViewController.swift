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
    
    // VARIABLES
    var instrStrings: Array<UIView> = []
    var instrFrets: Array<UIView> = []
    var noteButtons: Array<UIButton> = []
    var isPlaying = false
    var points = 0
    
    // COLORS
    let myGreen = UIColor(red: 103/255.0, green: 178/255.0, blue: 104/255.0, alpha: 1.0)
    
    let possibleNotes: Array<String> = ["A♭","A","A♯","B♭","B","C","C♯","D♭","D","D♯","E♭","E","E♯","F","F♯","G♭","G","G#"]
    
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
        let lineMaker = Lines(screenDimensions: screenSize)
        instrStrings.append(lineMaker.generateHorizontalLine(stringName: "E"))
        instrStrings.append(lineMaker.generateHorizontalLine(stringName: "A"))
        instrStrings.append(lineMaker.generateHorizontalLine(stringName: "D"))
        instrStrings.append(lineMaker.generateHorizontalLine(stringName: "G"))
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
        instrFrets.append(lineMaker.generateVerticalLine(stringName: "13"))

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
            self.noteName.text = self.possibleNotes[Int(arc4random_uniform(UInt32(self.possibleNotes.count - 1)))]
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton){
        FButton.backgroundColor = .clear
        FButton.layer.cornerRadius = 20
        FButton.layer.borderWidth = 1
        FButton.layer.borderColor = UIColor.black.cgColor
        if self.noteName.text == sender.titleLabel?.text {
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

