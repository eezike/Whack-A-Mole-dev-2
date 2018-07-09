//
//  ViewController.swift
//  Word Play
//
//  Created by Emeka Ezike on 7/4/18.
//  Copyright © 2018 Emeka Ezike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IB Outlets
    @IBOutlet weak var adjectiveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //My variables
    var timer = Timer()
    var cycle = 0.0
    var index = 0
    let array = ["Funky", "Hysterical", "Exciting", "Weird","Ugly", "Speedy","Grand", "Yucky", ""]
    
    //======================================
    //Timer and function to make the array run forever with delay
    func resetTimer(){
        cycle += 0.2
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: cycle, target: self, selector: #selector(updateDisplay), userInfo: nil, repeats: true)
    }
    
    @objc func updateDisplay()
    {
        resetTimer()
        index += 1
        if index == 8
        {
            index = 0
        }
        adjectiveLabel.text = array [index]
        
    }
  //==========================================

    
    //Words will change when view appears
    override func viewWillAppear(_ animated: Bool) {
        updateDisplay()
    }
    
    //Restart button (on third vc) connects to this
    @IBAction func unwindToInitialViewController(segue: UIStoryboardSegue){
        
    }
    
   
}
