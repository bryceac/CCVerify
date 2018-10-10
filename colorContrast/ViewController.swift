//
//  ViewController.swift
//  colorContrast
//
//  Created by Bryce Campbell on 10/9/18.
//  Copyright © 2018 Bryce Campbell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorAreaController: UISegmentedControl!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redValue: UITextField!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenValue: UITextField!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueValue: UITextField!
    @IBOutlet weak var hexCode: UITextField!
    @IBOutlet weak var textView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: UIButton) {
    }
    
}

