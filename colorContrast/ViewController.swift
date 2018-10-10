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
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redValue: UITextField!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenValue: UITextField!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueValue: UITextField!
    @IBOutlet weak var hexCode: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // updateBackgrounColor is used to change the background color of the preview
    func updateBackgroundColor(withRed: CGFloat, green: CGFloat, blue: CGFloat) {
        colorView.layer.backgroundColor = UIColor(red: withRed/255, green: green/255, blue: blue/255, alpha: 1).cgColor
    }
    
    func updateTextColor(withRed: CGFloat, green: CGFloat, blue: CGFloat) {
        textView.textColor = UIColor(red: withRed/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    // reset function is a function that will set things back to the default values
    @IBAction func reset(_ sender: UIButton) {
    }
    
}

