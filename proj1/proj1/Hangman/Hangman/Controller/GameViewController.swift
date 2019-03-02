//
//  GameViewController.swift
//  Hangman
//
//  Created by hyoungjin cho on 2/26/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    
    let hangman = Hangman();
    var phrase: String!
    var correctList: [Character] = []
    var incorrectList:[Character] = []
    var split_phrase:Array<Character>!
    var phrase_answer: String!
    var stop_guess = false
    
    let image = [#imageLiteral(resourceName: "hangman1"),#imageLiteral(resourceName: "hangman2"), #imageLiteral(resourceName: "hangman3"), #imageLiteral(resourceName: "hangman4"), #imageLiteral(resourceName: "hangman5"), #imageLiteral(resourceName: "hangman6"), #imageLiteral(resourceName: "hangman7") ]

    @IBOutlet weak var hangmanImageview: UIImageView!
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        if count > 1 { return false }
        if string.rangeOfCharacter(from: .letters) != nil || string == ""{
            return true
        }else {
            return false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawHangman()
        phrase = hangman.getPhrase()
        split_phrase = Array(phrase)
        phraseLabel.text = updatePhraseLabelText()
        incorrectLabel.text = ""

        self.userInput.delegate = self
    }
    
    @IBAction func textFieldPressed(_ sender: UITextField) {
        self.userInput.becomeFirstResponder()
    }
    
    @IBAction func textFieldOutSidePressed(_ sender: UITextField) {
        self.userInput.resignFirstResponder()
    }
    @IBAction func returnPressed(_ sender: UITextField) {
        self.userInput.resignFirstResponder()
    }
    
    /*
     Set current hangman state's image to the imageview
     */
    func drawHangman() {
        hangmanImageview.image = image[hangman.getCurrentState()]
    
    }
    
    /*
     Update phraseLabel text
     */
    func updatePhraseLabelText() -> String {
        
        var originString = ""
        var updateString = ""
        
        /*set original stage with all underscores*/
        if correctList == [] {
            for char in split_phrase{
                if char == " "{
                    originString += " "
                } else {
                    originString += "_ "
                }
            }
            return originString
            
        } else {
            for char in split_phrase{
                
                if correctList.contains(char)  {
                    updateString.append(char)
                } else if char == " " {
                    updateString += " "
                } else {
                    updateString += "_ "
                }
            }
            return updateString
        }
    }
    
    func updateIncorrectLabelText(){
        var temp:String = ""
        for char in incorrectList {
            temp += String(char) + ", "
        }
        temp = String(temp.dropLast())
        temp = String(temp.dropLast())
        incorrectLabel.text = temp
    }

    
    
    /*
     guess button pressed
    */
    @IBAction func makeGuess(_ sender: UIButton) {
        if userInput.text != ""  && stop_guess == false{
            let guess = userInput.text?.lowercased()
            userInput.text = ""
            testInput(Character(guess!))
        }
    }

    
    func restart() {
        stop_guess = false
        hangman.restartGame()
        correctList.removeAll()
        incorrectList.removeAll()
        phrase = hangman.getPhrase()
        split_phrase = Array(phrase)
        phraseLabel.text = updatePhraseLabelText()
        incorrectLabel.text = ""
        drawHangman()
    }
    
    /*
     set Alert
     */
    
   /* func WinAlert(){
        let win_alert = UIAlertController(title: "Alert", message: "You Win!!!", preferredStyle:UIAlertController.Style.alert)
        win_alert.addAction(UIAlertAction(title: "click", style: UIAlertAction.Style.default, handler: {(LoseAlert:UIAlertAction) -> Void in self.restart()}))
        self.present(win_alert, animated: true, completion: nil)
    }
 */
    func WinAlert(){
        let win_alert = UIAlertController(title: "Alert", message: "You Win!!!", preferredStyle:UIAlertController.Style.alert)
        win_alert.addAction(UIAlertAction(title: "click", style: UIAlertAction.Style.default, handler: nil))
        self.present(win_alert, animated: true, completion: nil)
    }
    
    /*func LoseAlert(){
        let lose_alert = UIAlertController(title: "Alert", message: "Try again!!!", preferredStyle: UIAlertController.Style.alert)
  
    
        lose_alert.addAction(UIAlertAction(title: "Restart", style: UIAlertAction.Style.default, handler: {
            (LoseAlert:UIAlertAction) -> Void in self.restart()
        }))
        
        self.present(lose_alert, animated: true, completion: nil)

        
    }*/
    func LoseAlert(){
        let lose_alert = UIAlertController(title: "Alert", message: "Try again!!!", preferredStyle: UIAlertController.Style.alert)
        
        
        lose_alert.addAction(UIAlertAction(title: "click", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(lose_alert, animated: true, completion: nil)
        
        
    }
    
    
    
    
    func testInput(_ guess: Character) {
        
        if split_phrase.contains(guess) {
            if correctList == [] || correctList.contains(guess) == false {
                correctList.append(guess)
                phraseLabel.text = updatePhraseLabelText()
                print(phrase)
                print(guess)
            }
            if phraseLabel.text == phrase {
                stop_guess = true
                WinAlert()
            }
        } else {
            if incorrectList == [] || incorrectList.contains(guess) == false {
                hangman.wrongGuess()
                incorrectList.append(guess)
                updateIncorrectLabelText()
                drawHangman()
                print(phrase)
                print(guess)
                print("wrong")
            }
            if hangman.isDead() {
                stop_guess = true
                LoseAlert()
            }
        }

    }
    
    @IBAction func RetartButton(_ sender: UIButton) {
        restart()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
