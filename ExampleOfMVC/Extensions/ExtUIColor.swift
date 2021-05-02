//
//  Ext_UIColor.swift
//  ExampleOfMVC
//
//  Created by Faiq Khan on 02/05/2021.
//

import UIKit

extension UIColor {
    static let mainThemeColour   = UIColor.rgba(r: 77, g: 77, b: 77, a: 1.0)
    
    static func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
