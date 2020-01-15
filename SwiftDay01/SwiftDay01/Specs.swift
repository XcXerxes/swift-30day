//
//  Specs.swift
//  SwiftDay01
//
//  Created by leo on 14/01/2020.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

public struct Specs {
    public struct Color {
        public let tint = UIColor(red: 119/255, green: 167/255, blue: 255/255, alpha: 1)
        public let red = UIColor.red
        public let white = UIColor.white
        public let black = UIColor.black
        public let gray = UIColor.lightGray
    }
    
    public struct FontSize {
        public let tiny: CGFloat = 10
        public let small: CGFloat = 12
        public let regular: CGFloat = 14
        public let large: CGFloat = 16
    }
    public struct ImageName {
      public let friends = "fb_friends"
      public let events = "fb_events"
      public let groups = "fb_groups"
      public let education = "fb_education"
      public let townHall = "fb_town_hall"
      public let instantGames = "fb_games"
      public let settings = "fb_settings"
      public let privacyShortcuts = "fb_privacy_shortcuts"
      public let helpSupport = "fb_help_and_support"
      public let placeholder = "fb_placeholder"
    }
    
    public static var color: Color {
        return Color()
    }
    public static var fontSize: FontSize {
        return FontSize()
    }
    public static var imageName: ImageName {
        return ImageName()
    }
}
