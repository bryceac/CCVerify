//
//  ViewController.swift
//  colorContrast
//
//  Created by Bryce Campbell on 10/9/18.
//  Copyright © 2018 Bryce Campbell. See LICENSE for details of rights.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {
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
        
        // set delegate for text fields
        redValue.delegate = self
        greenValue.delegate = self
        blueValue.delegate = self
        hexCode.delegate = self
        
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
            let RGB = textView.textColor.rgb() // retrieve RGB values from UIColor
            
            redValue.text = "\(RGB?.red ?? 0)" // put red number in the red field
            greenValue.text = "\(RGB?.green ?? 0)" // put green number in the green field
            blueValue.text = "\(RGB?.blue ?? 0)" // put blue number in the blue field
            
            // put RGB values onto slider each number is casted to a Float individually for math to be right.
            redSlider.value = Float(Int(redValue.text!)!)/Float(255)
            greenSlider.value = Float(Int(greenValue.text!)!)/Float(255)
            blueSlider.value = Float(Int(blueValue.text!)!)/Float(255)
            
            // retrieve color hex code and put it in Hex code field
            hexCode.text = "#\(rgbHex.rgbToHex(red: Int(redValue.text!)!, green: Int(greenValue.text!)!, blue: Int(blueValue.text!)!))"
        } else {
            let RGB = UIColor(cgColor: colorView.layer.backgroundColor!).rgb() // convert CGColor to UIColor and get RGB values
            
            redValue.text = "\(RGB?.red ?? 0)"
            greenValue.text = "\(RGB?.green ?? 0)"
            blueValue.text = "\(RGB?.blue ?? 0)"
            
            redSlider.value = Float(Int(redValue.text!)!)/Float(255)
            greenSlider.value = Float(Int(greenValue.text!)!)/Float(255)
            blueSlider.value = Float(Int(blueValue.text!)!)/Float(255)
            
            hexCode.text = "#\(rgbHex.rgbToHex(red: Int(redValue.text!)!, green: Int(greenValue.text!)!, blue: Int(blueValue.text!)!))"
        }
    }
    
    // indexChanged runs, when segment view is changed and makes sure the fields show the right values
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
    func removePoundSign(from: String) -> String {
        if from.contains("#") {
            var hex = Array(from)
            
            hex.remove(at: hex.index(where: { $0 == "#"})!) // remove from wherever it might be in string
            return String(hex)
        } else {
            return from
        }
    }
    
    // function that will run when user changes data in text fields
    @IBAction func dataChanged(_ sender: UITextField) {
        // use switch statement to update colors appropriately based on the field. case 3 is the hex code field and 0-2 are the RGB values
        switch sender.tag {
        case 0, 1, 2:
            let alert = UIAlertController(title: "Error!", message: "Values are not numerical. Please use numeric characters.", preferredStyle: .alert) // create an alert for when values are not numerical
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil)) // add action to Alert
            
            // check that sent field can be converted to a float
            if Float(sender.text!) != nil {
                if colorAreaController.selectedSegmentIndex == 0 {
                    updateBackgroundColor(withRed: CGFloat(Float(redValue.text!)!/Float(255)), green: CGFloat(Float(greenValue.text!)!/Float(255)), blue: CGFloat(Float(blueValue.text!)!/Float(255)))
                    getValues()
                } else {
                    updateTextColor(withRed: CGFloat(Float(redValue.text!)!/Float(255)), green: CGFloat(Float(greenValue.text!)!/Float(255)), blue: CGFloat(Float(blueValue.text!)!/Float(255)))
                    getValues()
                }
            } else {
                self.present(alert, animated: true, completion: nil) // display alert
            }
        case 3:
            let alert = UIAlertController(title: "Error!", message: "Hex code size is not correct. String must have 6 characters", preferredStyle: .alert) // create an alert for when hex code has more or less than 6 characters after removing '#'
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil)) // add action to Alert
            
            let HEX = removePoundSign(from: hexCode.text!)
            
            // check the hex code length
            if HEX.count == 6 {
                let RGB = rgbHex.hexToRGB(hex: HEX) // get RGB values from hex
            
                if colorAreaController.selectedSegmentIndex == 0 {
                    updateBackgroundColor(withRed: CGFloat(Float(RGB[0])/Float(255)), green: CGFloat(Float(RGB[1])/Float(255)), blue: CGFloat(Float(RGB[2])/Float(255)))
                    getValues()
                } else {
                    updateTextColor(withRed: CGFloat(Float(RGB[0])/Float(255)), green: CGFloat(Float(RGB[1])/Float(255)), blue: CGFloat(Float(RGB[2])/Float(255)))
                    getValues()
                }
            } else {
                self.present(alert, animated: true, completion: nil)
            }
        default: ()
        }
    }
    
    // function from UITextField delegate to try and dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // resign the first responder
        return true
    }
    
    
    
}

