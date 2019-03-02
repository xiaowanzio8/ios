//
//  Hangman.swift
//  Hangman
//
//  Created by hyoungjin cho on 2/26/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class Hangman {
    private let maxState = 6
    private var phrases: [String] = []
    private var currentState = 0
    private var phrase: String!
    private var dead = false

    
    init() {
        if let URL = Bundle.main.url(forResource: "phrases", withExtension: "plist") {
            if let stringFromPlist = NSArray(contentsOf :URL) as? [String] {
                phrases = stringFromPlist
            }
        }
    }
    
    /*
     get phrase
    */
    func getPhrase() -> String {
        phrase = self.phrases[Int.random(in: 0..<phrases.count)]
        return phrase
    }

    
    func restartGame() {
        currentState = 0
        dead = false
        
    }
    
    /*
     Returns an image file name that corresponds to currentState.
     */
    func getCurrentState() -> Int {
        assert(currentState <= maxState)
        return currentState
    }
    
    func isDead() -> Bool{
        return dead
    }
    
    func wrongGuess(){
        currentState += 1
        if currentState == maxState {
            dead = true
        }
    }

}
