//
//  Specs.swift
//  SwiftDay03
//
//  Created by leo on 1/16/20.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

struct Specs {
    public struct Color {
        public let candyGreen = UIColor(red: 67.0/255.0, green: 205.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        public let white = UIColor.white
        public let black = UIColor.black
    }
    public struct ImageName {
        public let logo = "Logo"
        public let inlineLogo = "Inline-Logo"
    }
    
    static var color: Color {
        return Color()
    }
    static var imageName: ImageName {
        return ImageName()
    }
}
