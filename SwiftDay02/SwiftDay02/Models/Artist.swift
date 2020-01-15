//
//  Artist.swift
//  SwiftDay02
//
//  Created by leo on 15/01/2020.
//  Copyright © 2020 leo. All rights reserved.
//

import UIKit

struct Artist {
    let name: String
    let bio: String
    let image: UIImage
    var works: [Work]
    
    init(name: String, bio: String, image: UIImage, works: [Work]) {
        self.name = name
        self.bio = bio
        self.image = image
        self.works = works
    }
    
    static func artistsFromBundle() -> [Artist] {
        var artists = [Artist]()
        guard let url = Bundle.main.url(forResource: "artists", withExtension: "json") else {
            return artists
        }
        do {
            let data = try Data(contentsOf: url)
            guard let rootObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return artists
            }
            guard let artistObjects = rootObject["artists"] as? [[String: AnyObject]] else {
                return artists
            }
            for artistObject in artistObjects {
                if let name = artistObject["name"] as? String,
                let bio = artistObject["bio"] as? String,
                let imageName = artistObject["image"] as? String,
                let image = UIImage(named: imageName),
                let worksObject = artistObject["works"] as? [[String: String]] {
                    var works = [Work]()
                    for work in worksObject {
                        if let workTitle = work["title"],
                        let workImageName = work["image"],
                        let workImage = UIImage(named: workImageName + ".jpg"),
                            let info = work["info"] {
                            works.append(Work(title: workTitle, image: workImage, info: info, isExpandes: false))
                        }
                    }
                    artists.append(Artist(name: name, bio: bio, image: image, works: works))
                }
            }
        } catch {
            return artists
        }
        return artists
    }
}
