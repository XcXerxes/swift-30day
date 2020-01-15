//
//  FBMeUser.swift
//  SwiftDay01
//
//  Created by leo on 14/01/2020.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

class FBMeUser {
    var name: String
    var avatarName: String
    var education: String
    
    init(name: String, avatarName: String = "bayMax", education: String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
}
