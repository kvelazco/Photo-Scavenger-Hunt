//
//  Hunt.swift
//  Photo Scavenger Hunt
//
//  Created by Kevin Velazco on 2/19/23.
//

import UIKit
import CoreLocation

class Hunt {
    let title: String
    let description: String
    var image: UIImage?
    var imageLocation: CLLocation?
    var isComplete: Bool {
        image != nil
    }

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    func set(_ image: UIImage, with location: CLLocation) {
        self.image = image
        self.imageLocation = location
    }
}

extension Hunt {
    static var mockedHunts: [Hunt] {
        return [
            Hunt(title: "Your favorite local restaurant",
                 description: "Best yummy food."),
            Hunt(title: "Your favorite park",
                 description: "Time for a great walk."),
            Hunt(title: "Your favorite bar",
                 description: "Drink to your heart's content.")
        ]
    }
}

