
import Foundation

// RGBHex class is a class that can be used to get Hex color codes or convert codes to RGB values
class RGBHex {
    let hexValues: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]

    // rgbToHex is a function used to retrieve the hex code for colors
    func rgbToHex(red: Int, green: Int, blue: Int) -> String {
        // the following retrieve the right characters from the array by dividing the respective RGB values by 16 and grabbing the second character based on the remainder
        let redHex: String = "\(hexValues[red/16])\(hexValues[red%16])"
        let greenHex: String =  "\(hexValues[green/16])\(hexValues[green%16])"
        let blueHex: String = "\(hexValues[blue/16])\(hexValues[blue%16])"

        // send out the complete six character string
        return "\(redHex)\(greenHex)\(blueHex)"
    }

    // the following functions take the hex code and find the hex values for each of the three colors, so they can be used to accurately convert to RGB
    func redHex(from: String) -> String {
        return String(from.prefix(2)) // grab the first two characters from the hex code
    }

    func greenHex(from: String) -> String {
        var green = "" // create an empty variable to hold the green hex

        // loop through the hex string and only grab the middle two numbers
        for i in 0..<Array(from).count {
            if (i > 1 && i < 4) {
                green += String(Array(from)[i]) // add characters to string variable
            }
        }

        // send out the two character hex code
        return green
    }

    func blueHex(from: String) -> String {
        return String(from.suffix(2)) // grab the last two characters of the hex code
    }

    // the following three functions actually do the work in converting the hex code to RGB values by multiplying the first character by 16 and adding the second
    func redDecimal(from: String) -> Int {
        return (hexValues.index(where: { $0.caseInsensitiveCompare(String(from.prefix(1))) == .orderedSame})! * 16) + hexValues.index(where: { $0.caseInsensitiveCompare(String(from.suffix(1))) == .orderedSame})!
    }

    func greenDecimal(from: String) -> Int {
        return (hexValues.index(where: { $0.caseInsensitiveCompare(String(from.prefix(1))) == .orderedSame})! * 16) + hexValues.index(where: { $0.caseInsensitiveCompare(String(from.suffix(1))) == .orderedSame})!
    }

    func blueDecimal(from: String) -> Int {
        return (hexValues.index(where: { $0.caseInsensitiveCompare(String(from.prefix(1))) == .orderedSame})! * 16) + hexValues.index(where: { $0.caseInsensitiveCompare(String(from.suffix(1))) == .orderedSame})!
    }

    // hexToRGB takes a hex values and returns an Integer array with the three values contained inside
    func hexToRGB(hex: String) -> [Int] {
        return [redDecimal(from: redHex(from: hex)), greenDecimal(from: greenHex(from: hex)), blueDecimal(from: blueHex(from: hex))]
    }
}
