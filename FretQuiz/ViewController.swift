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
    var noteButtons: Array<UIButton> = []

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
    
    @IBOutlet var testLabel: UILabel!
    @IBOutlet var noteName: UILabel!
    
    @IBOutlet var rightWrong: UILabel!
    var whoPressed_S = "PLAY"
    var isPlaying = false
    let priority = DispatchQueue.GlobalQueuePriority.default
    
    let possibleNotes: Array<String> = ["A♭","A","A♯","B♭","B","C","C♯","D♭","D","D♯","E♭","E","E♯","F","F♯","G♭","G","G#"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        makeFretboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeFretboard(){
        let lineMaker = Lines()
        instrStrings.append(lineMaker.generateLine(stringName: "E"))
        instrStrings.append(lineMaker.generateLine(stringName: "A"))
        instrStrings.append(lineMaker.generateLine(stringName: "D"))
        instrStrings.append(lineMaker.generateLine(stringName: "G"))
        
        for strng in instrStrings {
            self.view.addSubview(strng)
        }
        print("Fretboard is set up")
    }
    
    func playGame(){
        var correct = false
        var randIndex = -1
        DispatchQueue.global(qos: .default).async {
            while(self.isPlaying == true){
                randIndex = Int(arc4random_uniform(UInt32(self.possibleNotes.count - 1)))
                correct = false

                while(correct == false){
                    DispatchQueue.main.async {
                        self.noteName.text = self.possibleNotes[randIndex]
                    }
                    if(self.possibleNotes[randIndex] == self.whoPressed_S){
                        print("Correct")
                        DispatchQueue.main.async {
                            self.rightWrong.text = "Correct"
                            correct = true
                            self.whoPressed_S = ""
                        }
                    }
                }
            }
        }
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
    
    func whoPressed(label: String) {
        whoPressed_S = label
    }
    
    @IBAction func buttonPressed(_ sender: UIButton){
        if let text = sender.titleLabel?.text {
            whoPressed(label: text)
        }
    }
    
    @IBAction func playIt(_ sender: UIButton) {
        isPlaying = true
        playGame()
    }
    
}

