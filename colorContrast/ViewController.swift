//
//  ViewController.swift
//  colorContrast
//
//  Created by Bryce Campbell on 10/9/18.
//  Copyright © 2018 Bryce Campbell. All rights reserved.
//

import UIKit
import Foundation

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
            greenSlider.value = Float(Int(greenValue.text!)!/255)
            blueSlider.value = Float(Int(blueValue.text!)!/255)
            
            hexCode.text = "#\(rgbHex.rgbToHex(red: Int(redValue.text!)!, green: Int(greenValue.text!)!, blue: Int(blueValue.text!)!))"
        } else {
            let RGB = UIColor(cgColor: colorView.layer.backgroundColor!).rgb()
            
            redValue.text = "\(RGB?.red ?? 0)"
            greenValue.text = "\(RGB?.green ?? 0)"
            blueValue.text = "\(RGB?.blue ?? 0)"
            
            redSlider.value = Float(Int(redValue.text!)!/255)
            greenSlider.value = Float(Int(greenValue.text!)!/255)
            blueSlider.value = Float(Int(blueValue.text!)!/255)
            
            hexCode.text = "#\(rgbHex.rgbToHex(red: Int(redValue.text!)!, green: Int(greenValue.text!)!, blue: Int(blueValue.text!)!))"
        }
    }
    
    // indexChanged runs, when segment view is changed
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        getValues()
    }
    
    
    // reset function is a function that will set things back to the default values
    @IBAction func reset(_ sender: UIButton) {
        updateBackgroundColor(withRed: 0, green: 0, blue: 0) // give color view a black background
        updateTextColor(withRed: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0) // make text color white
        getValues()
    }
    
    // valueChanged updates things when user moves slider
    @IBAction func valueChanged(_ sender: UISlider) {
        if colorAreaController.selectedSegmentIndex == 0 {
            updateBackgroundColor(withRed: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value))
            getValues()
        } else {
            updateTextColor(withRed: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value))
            getValues()
        }
    }
    
    // the following function will remove '#' from string, so conversion can be right
    /* func removePoundSign(from: String) -> String {
        if from.contains("#") {
            var hex = Array(from)
            hex.removeFirst()
            return String(hex)
        } else {
            return from
        }
    } */
    
    // function that will run when user changes data in text fields
    /* @IBAction func dataChanged(_ sender: UITextField) {
        switch sender.tag {
        case 0, 1, 2:
            if colorAreaController.selectedSegmentIndex == 0 {
                updateBackgroundColor(withRed: CGFloat(Int(redValue.text!)!/255), green: CGFloat(Int(greenValue.text!)!/255), blue: CGFloat(Int(blueValue.text!)!/255))
                getValues()
            } else {
                updateTextColor(withRed: CGFloat(Int(redValue.text!)!/255), green: CGFloat(Int(greenValue.text!)!/255), blue: CGFloat(Int(blueValue.text!)!/255))
                getValues()
            }
        case 3:
            let HEX = removePoundSign(from: hexCode.text!)
            let RGB = rgbHex.hexToRGB(hex: HEX) // get RGB values from hex
            
            if colorAreaController.selectedSegmentIndex == 0 {
                updateBackgroundColor(withRed: CGFloat(RGB[0]/255), green: CGFloat(RGB[1]/255), blue: CGFloat(RGB[2]/255))
                getValues()
            } else {
                updateTextColor(withRed: CGFloat(RGB[0]/255), green: CGFloat(RGB[1]/255), blue: CGFloat(RGB[2]/255))
                getValues()
            }
        default: ()
        }
    } */
    
    
    
}

