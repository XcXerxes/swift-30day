//
//  Specs.swift
//  SwiftDay02
//
//  Created by leo on 15/01/2020.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit
public struct Specs {
    public struct Color {
        public let tint = UIColor(red: 105/255, green: 159/255, blue: 56/255, alpha: 1)
        public let red = UIColor.red
        public let white = UIColor.white
        public let gray = UIColor.gray
        public let black = UIColor.black
        public let orange = UIColor.orange
    }
    public struct FontSize {
        public let tiny: CGFloat = 10
        public let small: CGFloat = 12
        public let regular: CGFloat = 14
        public let large: CGFloat = 16
        public let mLarge: CGFloat = 18
        public let xLarge: CGFloat = 24
    }
    
    public static var color: Color {
        return Color()
    }
    public static var fontSize: FontSize {
        return FontSize()
    }
}
