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
    
    var whoPressed_S = ""
    
    let possibleNotes: Array<String> = ["A♭","A","A♯","B♭","B","C","C♯","D♭","D","D♯","E♭","E","E♯","F","F♯","G♭","G","G#"]

    
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
        
        // playGame()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playGame(){
        sleep(2)
        for num in 1...10 {
            while(whoPressed_S == ""){}
            let randIndex = Int(arc4random_uniform(UInt32(possibleNotes.count - 1)))
            if possibleNotes[randIndex] == whoPressed_S {
                print("Correct")
                whoPressed_S = ""
            }
                
            else {
                print("incorrect")
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
    
    @IBAction func buttonPressed(_ sender: UIButton){
        if let text = sender.titleLabel?.text {
            print(text)
            //whoPressed(label: text)
        }
        //else { whoPressed(label: "") }
    }
    
    func whoPressed(label: String) {
        whoPressed_S = label
    }
}

