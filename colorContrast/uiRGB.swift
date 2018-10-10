//
//  uiRGB.swift
//  colorContrast
//
//  Created by Bryce Campbell on 10/9/18.
//  Copyright © 2018 Bryce Campbell. All rights reserved.
//

import UIKit

extension UIColor {
    
    // rgb function is used to retrieve RGB values of UIColor
    func rgb() -> (red: Int, green:Int, blue: Int, alpha: Double)? {
        var redValue: CGFloat = 0 // variable to hold red value
        var greenValue: CGFloat = 0 // variable to hold the green value
        var blueValue: CGFloat = 0 // variable to hold blue value
        var alphaValue: CGFloat = 0 // variable to hold the alpha value
        
        if self.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue) {
            // multiple each of the RGB values by 255 and type cast them to integers
            let RED = Int(redValue*255)
            let GREEN = Int(greenValue*255)
            let BLUE = Int(blueValue*255)
            let ALPHA = Double(alphaValue)
            
            // return values in Tuple, so they can be retrieved easily
            return (red: RED, green: GREEN, blue: BLUE, alpha: ALPHA)
        } else {
            return nil
        }
    }
}
