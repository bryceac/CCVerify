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
    let rgbHex: RGBHex = RGBHex() // add object of class, so that functions can be used
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let COLOR_AREA_OPTIONS: [String] = ["Background", "Text"] // segment control text array
        
        colorAreaController.removeAllSegments() // remove premade segments
        
        // populate segment controller with those in array
        for i in 0..<COLOR_AREA_OPTIONS.count {
            colorAreaController.insertSegment(withTitle: COLOR_AREA_OPTIONS[i], at: i, animated: false)
        }
        
        colorAreaController.selectedSegmentIndex = 0 // set default segment
        
        colorView.layer.borderColor = UIColor.black.cgColor // create a black border
        colorView.layer.borderWidth = 5 // set border width to 5
        colorView.layer.cornerRadius = 10 // give corners a radius of 10
        
        updateBackgroundColor(withRed: 0, green: 0, blue: 0) // give color view a black background
        updateTextColor(withRed: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0) // make text color white
        
        getValues() // get default values
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // updateBackgrounColor is used to change the background color of the preview
    func updateBackgroundColor(withRed: CGFloat, green: CGFloat, blue: CGFloat) {
        colorView.layer.backgroundColor = UIColor(red: withRed, green: green, blue: blue, alpha: 1).cgColor
    }
    
    // updateTextColor function is used to update the color of the text
    func updateTextColor(withRed: CGFloat, green: CGFloat, blue: CGFloat) {
        textView.textColor = UIColor(red: withRed, green: green, blue: blue, alpha: 1)
    }
    
    // getValues function updates the field appropiately, in order to give accurate info
    func getValues() {
        if colorAreaController.selectedSegmentIndex == 1 {
            let RGB = textView.textColor.rgb()
            
            redValue.text = "\(RGB?.red ?? 0)"
            greenValue.text = "\(RGB?.green ?? 0)"
            blueValue.text = "\(RGB?.blue ?? 0)"
            
            redSlider.value = Float(Int(redValue.text!)!/255)
            greenSlider.value = Float(Int(redValue.text!)!/255)
            blueSlider.value = Float(Int(redValue.text!)!/255)
            
            hexCode.text = "#\(rgbHex.rgbToHex(red: Int(redValue.text!)!, green: Int(greenValue.text!)!, blue: Int(blueValue.text!)!))"
        } else {
            let RGB = UIColor(cgColor: colorView.layer.backgroundColor!).rgb()
            
            redValue.text = "\(RGB?.red ?? 0)"
            greenValue.text = "\(RGB?.green ?? 0)"
            blueValue.text = "\(RGB?.blue ?? 0)"
            
            redSlider.value = Float(Int(redValue.text!)!/255)
            greenSlider.value = Float(Int(redValue.text!)!/255)
            blueSlider.value = Float(Int(redValue.text!)!/255)
            
            hexCode.text = "#\(rgbHex.rgbToHex(red: Int(redValue.text!)!, green: Int(greenValue.text!)!, blue: Int(blueValue.text!)!))"
        }
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        getValues()
    }
    
    
    // reset function is a function that will set things back to the default values
    @IBAction func reset(_ sender: UIButton) {
        updateBackgroundColor(withRed: 0, green: 0, blue: 0) // give color view a black background
        updateTextColor(withRed: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0) // make text color white
        getValues()
    }
    @IBAction func valueChanged(_ sender: UISlider) {
    }
    
    
    
}

