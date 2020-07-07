//
//  Person.swift
//  backToBasics
//
//  Created by Rodrigo Conte on 05/07/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import UIKit

class Person: NSObject {
    let name: String
    let email: String
    let age: Int
    var Address: Array<Address> = []
    
    init(name: String, email: String, age: Int) {
        self.name = name
        self.email = email
        self.age = age
    }
    
}
