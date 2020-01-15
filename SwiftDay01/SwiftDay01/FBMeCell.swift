//
//  FBMeCell.swift
//  SwiftDay01
//
//  Created by leo on 14/01/2020.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

class FBMeCell: UITableViewCell {
    static let identifier = "FBMeCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        backgroundColor = Specs.color.white
        textLabel?.textColor = Specs.color.black
        
        detailTextLabel?.textColor = Specs.color.gray
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
