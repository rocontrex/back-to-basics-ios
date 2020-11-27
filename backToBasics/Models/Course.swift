//
//  Couse.swift
//  backToBasics
//
//  Created by Rodrigo Conte on 26/11/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import Foundation

class Course: NSObject {
    
    let name: String
    let details: String
    let price: String
    
    init(name: String, details: String, price: String) {
        self.name = name
        self.details = details
        self.price = price
    }
    
}
