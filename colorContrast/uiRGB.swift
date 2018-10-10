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
        var redValue: CGFloat = 0
        var greenValue: CGFloat = 0
        var blueValue: CGFloat = 0
        var alphaValue: CGFloat = 0
        
        if self.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue) {
            let RED = Int(redValue*255)
            let GREEN = Int(greenValue*255)
            let BLUE = Int(blueValue*255)
            let ALPHA = Double(alphaValue)
            
            return (red: RED, green: GREEN, blue: BLUE, alpha: ALPHA)
        } else {
            return nil
        }
    }
}
