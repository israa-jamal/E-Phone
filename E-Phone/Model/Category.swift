//
//  Category.swift
//  E-Phone
//
//  Created by Esraa Gamal on 9/18/20.
//  Copyright © 2020 Esraa Gamal. All rights reserved.
//

import Foundation
import UIKit

class Category{
    
    var id: String 
    var name: String
    var imageName: String?
    var image: UIImage?
    
    init(dictionary: NSDictionary) {
        id = dictionary[K.objectId] as! String
        name = dictionary[K.name] as! String
        image = UIImage(named: dictionary[K.imageName] as? String ?? "")
    }
    init(_name: String, _imageName: String) {
        id = ""
        name = _name
        imageName = _imageName
        image = UIImage(named: _imageName)
    }
}
//Save Category Function




