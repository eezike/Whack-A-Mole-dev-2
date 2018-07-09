//
//  ThirdViewController.swift
//  Word Play
//
//  Created by Emeka Ezike on 7/4/18.
//  Copyright © 2018 Emeka Ezike. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    var score = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "Congradulations! You whacked \(score) moles!"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
}
