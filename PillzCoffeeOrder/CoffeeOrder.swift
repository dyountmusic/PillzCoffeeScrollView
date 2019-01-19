//
//  CoffeeOrder.swift
//  PillzCoffeeOrder
//
//  Created by Daniel Yount on 1/18/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation
import UIKit

struct CoffeeOrder {
    
    var title: String?
    var subtitle: String?
    var image: UIImage?
    var color: UIColor?
    
    init(title: String, subtitle: String, image: UIImage, color: UIColor) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.color = color
    }
    
}
