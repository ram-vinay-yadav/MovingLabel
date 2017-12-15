//
//  ViewController.swift
//  MovingLabel
//
//  Created by Ram Vinay on 15/12/17.
//  Copyright © 2017 Ram Vinay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let movingLabel = MovingUILabel(frame: CGRect(x:100, y:300, width:120, height:30))
        movingLabel.text  = "Marquee effect on UILabel by removing letters in front and adding in end in swift"
        movingLabel.repetedText = movingLabel.text
        movingLabel.textAlignment = .left
        movingLabel.textColor = UIColor.red
        movingLabel.backgroundColor = UIColor.blue
        movingLabel.isRepeate = true
        self.view .addSubview(movingLabel)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

