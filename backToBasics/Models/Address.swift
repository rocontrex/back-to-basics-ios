//
//  Address.swift
//  backToBasics
//
//  Created by Rodrigo Conte on 05/07/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import UIKit

class Address: NSObject {
    var street: String
    var number: String
    var country: String
    var state: String
    
    init(street: String, number: String, country: String, state: String) {
        self.street = street
        self.number = number
        self.country = country
        self.state = state
    }
}
